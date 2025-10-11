'use strict';

const db = require('../database');
const pubsub = require('../pubsub');

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

// REturned the cached list, ensuring it is initialized once
BannedWords.getAll = async function () {
	if (!loaded) {
		await reloadFromDb();
	}
	return cache.slice();
};


BannedWords.add = async function (word) {
	if (!word || typeof word !== 'string') {
		throw new Error('[[error:invalid-word]]');
	}
	const normalizedWord = word.toLowerCase().trim();
	if (!normalizedWord) {
		throw new Error('[[error:invalid-word]]');
	}
	await db.setAdd('banned-words', normalizedWord);
	if (!cache.includes(normalizedWord)) {
		cache.push(normalizedWord);
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