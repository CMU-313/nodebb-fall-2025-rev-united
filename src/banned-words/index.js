'use strict';

const db = require('../database');
const pubsub = require('../pubsub');
const batch = require('../batch');

const BannedWords = module.exports;

// Utility for safe regex construction
function escapeForRegex(word) {
	if (!word) return '';
	return word.replace(/[.*+?^${}()|[\]\\]/g, '\\$&').toLowerCase();
}

let cache = [];
let loaded = false;

// Hardcoded list of banned words for first sprint
BannedWords._words = [
	'spam',
	'badword',
	'inappropriate',
	'offensive',
	'hate',
	'abuse',
];

// Reloads the in-memory cache from the database
async function reloadFromDb() {
	cache = await db.getSetMembers('banned-words') || [];
	loaded = true;
}



BannedWords.init = async function () {
	// Migrate hardcoded words to database if database is empty (testing only)
	const existingWords = await db.getSetMembers('banned-words');
	if (!existingWords || existingWords.length === 0) {
		await Promise.all(BannedWords._words.map(word => BannedWords.add(word)));
	}

	await reloadFromDb();
	// Refresh cache across workers
	pubsub.on('meta:bannedwords:reload', reloadFromDb);
};

// Returns a shallow copy of the current in-memory
BannedWords.getList = function () {
	// Sync getter used by validators
	return cache.slice();
};

BannedWords.load = async function () {
	return await db.getSetMembers('banned-words');
};

// Returned the cached list, ensuring it is initialized once
BannedWords.getAll = async function () {
	if (!loaded) {
		await reloadFromDb();
	}
	return cache.slice();
};

// Retroactively scan all existing posts for a specific normalized word
BannedWords.scanExistingPostsForWord = async function (normalizedWord) {
	const w = String(normalizedWord || '').trim().toLowerCase();
	if (!w) return 0;

	const escaped = escapeForRegex(w);
	if (!escaped) return 0;

	// Non-word guards so symbol terms like "c++" match
	const regex = new RegExp(`(?:^|[^A-Za-z0-9_])${escaped}(?=$|[^A-Za-z0-9_])`, 'i');

	let total = 0;

	await batch.processSortedSet('posts:pid', async (pids) => {
		// Load posts
		const posts = await db.getObjects(pids.map(pid => `post:${pid}`));

		// Load topic titles and dedupe tids before fetching
		const tids = Array.from(new Set(posts.map(p => p && p.tid).filter(Boolean)));
		const topicObjs = tids.length ? await db.getObjects(tids.map(tid => `topic:${tid}`)) : [];
		const titleByTid = {};
		topicObjs.forEach((t) => { if (t && t.tid) titleByTid[String(t.tid)] = String(t.title || ''); });

		// Scan posts for matches
		const flagged = [];
		for (const p of posts) {
			const pid = p && p.pid;
			if (!pid) continue;

			const title = titleByTid[String(p.tid)] || '';
			const content = String(p.content || '');
			const text = `${title} ${content}`;

			if (text && regex.test(text)) {
				flagged.push(pid);
			}
		}

		// Bulk-write flags for this batch
		if (flagged.length) {
			const now = Date.now();
			await db.setObjectBulk(flagged.map(pid => [`post:${pid}:banned:matches`, { [w]: now }]));
			await db.sortedSetAdd('posts:flagged:banned', flagged.map(() => now), flagged);
			total += flagged.length;
		}
	}, { batch: 500 });

	return total;
};

BannedWords.add = async function (word) {
	if (!word || typeof word !== 'string') {
		throw new Error('[[error:invalid-word]]');
	}

	const originalWord = String(word).trim();
	const normalizedWord = originalWord.toLowerCase();
	if (!originalWord) {
		throw new Error('[[error:invalid-word]]');
	}

	// Check if new word, scan old posts if it is
	const isNew = !await db.isSetMember('banned-words', normalizedWord);

	await db.setAdd('banned-words', normalizedWord);

	if (isNew) {
		cache.push(originalWord);
		// Scan all existing posts and flag matches
		if (typeof BannedWords.scanExistingPostsForWord === 'function') {
			await BannedWords.scanExistingPostsForWord(normalizedWord);
		}
	}

	pubsub.publish('meta:bannedwords:reload');
};

BannedWords.remove = async function (word) {
	if (!word || typeof word !== 'string') {
		throw new Error('[[error:invalid-word]]');
	}
	const normalizedWord = word.toLowerCase().trim();
	await db.setRemove('banned-words', normalizedWord);
	cache = cache.filter(w => w !== normalizedWord);
	pubsub.publish('meta:bannedwords:reload');
};

BannedWords.exists = async function (word) {
	if (!word) return false;
	const normalizedWord = word.toLowerCase().trim();
	return await db.isSetMember('banned-words', normalizedWord);
};

// Update a banned word by removing the old and adding the new
BannedWords.update = async function (oldWord, newWord) {
	if (!oldWord || !newWord) {
		throw new Error('[[error:invalid-word]]');
	}
	await BannedWords.remove(oldWord);
	await BannedWords.add(newWord);
};

// Return a unique list of banned terms found in the given text (word-boundary, case-insensitive)
BannedWords.findMatches = function (rawText) {
	const text = String(rawText || '');
	if (!text.trim()) {
		return [];
	}
	const haystack = text.toLowerCase();
	const seen = new Set();
	const matches = [];

	for (const original of BannedWords.getList()) {
		const w = String(original || '').trim().toLowerCase();
		if (!w || seen.has(w)) continue;

		const escaped = escapeForRegex(w);
		if (!escaped) continue;

		// ASCII-safe version
		const regex = new RegExp(`(?:^|[^A-Za-z0-9_])${escaped}(?=$|[^A-Za-z0-9_])`, 'i');
		if (regex.test(haystack)) {
			matches.push(original);
			seen.add(w);
		}
	}
	return matches;
};