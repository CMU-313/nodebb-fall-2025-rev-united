'use strict';

const db = require('../database');
const pubsub = require('../pubsub');

const BannedWords = module.exports;

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

// Returns true if the given text contains any banned words
BannedWords.containsBannedWords = async function (text) {
	if (!text) return false;
	const words = await BannedWords.getAll();
	const lower = text.toLowerCase();
	return words.some(w => lower.includes(w));
};
