'use strict';

const assert = require('assert');
const BannedWords = require('../src/meta/bannedwords');
const db = require('./mocks/databasemock');

describe('BannedWords Data Layer', () => {
	before(async () => {
		// Clear DB set before each run
		await db.delete('banned-words');
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

	it('should detect banned words in text', async () => {
		await BannedWords.add('detectme');
		const result = await BannedWords.containsBannedWords('This should detectme easily');
		assert.strictEqual(result, true);
		const result2 = await BannedWords.containsBannedWords('No banned words here');
		assert.strictEqual(result2, false);
	});
});