'use strict';

const assert = require('assert');
const BannedWords = require('../src/banned-words');
const db = require('./mocks/databasemock');

describe('BannedWords Data Layer', () => {
	before(async () => {
		// Clear DB set before each run
		await db.delete('banned-words');
		await db.delete('posts:flagged:banned');
		await BannedWords.init();
	});

	it('should migrate hardcoded words on init', async () => {
		const words = await BannedWords.getAll();
		assert(words.length > 0);
		assert(words.includes('spam'));
	});

	it('should add a new banned word', async () => {
		await BannedWords.add('testword');
		const words = await BannedWords.getAll();
		assert(words.includes('testword'));
	});

	it('should remove a banned word', async () => {
		await BannedWords.add('removeme');
		await BannedWords.remove('removeme');
		const words = await BannedWords.getAll();
		assert(!words.includes('removeme'));
	});

	it('should update a banned word', async () => {
		await BannedWords.add('oldword');
		await BannedWords.update('oldword', 'newword');
		const words = await BannedWords.getAll();
		assert(!words.includes('oldword'));
		assert(words.includes('newword'));
	});

	it('should find banned words in text', async () => {
		await BannedWords.add('detectme');
		const hits = BannedWords.findMatches('This should detectme easily');
		assert.deepStrictEqual(hits, ['detectme']);
		const hits2 = BannedWords.findMatches('No banned words here');
		assert.deepStrictEqual(hits2, []);
	});

	it('should handle words with regex characters', async () => {
		await BannedWords.add('c++');
		const hits = BannedWords.findMatches('I prefer modern C++ code');
		assert.deepStrictEqual(hits, ['c++']);
		await BannedWords.remove('c++');
	});

	it('should reject empty words after trimming', async () => {
		await assert.rejects(BannedWords.add('   '), /invalid-word/);
	});

	it('getList returns a shallow copy', () => {
		const a = BannedWords.getList();
		const b = BannedWords.getList();
		assert.deepStrictEqual(a, b);
		assert.notStrictEqual(a, b);
	});
});