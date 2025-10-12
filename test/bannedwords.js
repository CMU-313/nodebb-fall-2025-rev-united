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

	it('should find nothing for empty/whitespace text', () => {
		const hits = BannedWords.findMatches('   ');
		assert.deepStrictEqual(hits, []);
	});

	it('should match words in topic titles as well as content during retro scan', async () => {
		// Arrange
		const tid = '910001';
		const pid = '810001';

		await Promise.all([
			db.delete(`topic:${tid}`),
			db.delete(`post:${pid}`),
			db.sortedSetRemove('posts:pid', pid),
			db.delete(`post:${pid}:banned:matches`),
			db.sortedSetRemove('posts:flagged:banned', pid),
		]);

		// Title only contains soon-to-be-banned word
		await db.setObject(`topic:${tid}`, { tid, title: 'Title has retrotitle', mainPid: pid });
		await db.setObject(`post:${pid}`, { pid, tid, content: 'Clean body' });
		await db.sortedSetAdd('posts:pid', Date.now(), pid);

		// Act
		await BannedWords.add('retrotitle');

		// Assert
		const flagged = await db.getSortedSetRange('posts:flagged:banned', 0, -1);
		assert(flagged.includes(pid));
		const matches = await db.getObject(`post:${pid}:banned:matches`);
		assert(matches && matches.retrotitle);
	});

	it('should not re-scan if word already exists', async () => {
		// Arrange a post that contains "dupeword"
		const tid = '910010';
		const pid = '810010';
		await Promise.all([
			db.delete(`topic:${tid}`),
			db.delete(`post:${pid}`),
			db.sortedSetRemove('posts:pid', pid),
			db.delete(`post:${pid}:banned:matches`),
			db.sortedSetRemove('posts:flagged:banned', pid),
		]);
		await db.setObject(`topic:${tid}`, { tid, title: 'Something', mainPid: pid });
		await db.setObject(`post:${pid}`, { pid, tid, content: 'dupeword inside content' });
		await db.sortedSetAdd('posts:pid', Date.now(), pid);

		// First add triggers scan
		await BannedWords.add('dupeword');
		let flagged = await db.getSortedSetRange('posts:flagged:banned', 0, -1);
		assert(flagged.includes(pid));

		// Cleanup flagged set and matches, then re-add same word — should NOT reflag
		await db.sortedSetRemove('posts:flagged:banned', pid);
		await db.delete(`post:${pid}:banned:matches`);
		await BannedWords.add('dupeword');

		flagged = await db.getSortedSetRange('posts:flagged:banned', 0, -1);
		assert(!flagged.includes(pid), 'Duplicate add should not re-scan/flag');
	});

	it('findMatches should be case-insensitive and de-duplicate', async () => {
		await BannedWords.add('MiXeDcAsE');
		const hits = BannedWords.findMatches('mixedcase appears twice: mixedcase');
		assert.deepStrictEqual(hits, ['MiXeDcAsE']);
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

	it('should retroactively flag existing posts when a new banned word is added', async () => {
		const tid = '900100';
		const pid = '800100';

		// Ensure clean keys for this test
		await Promise.all([
			db.delete(`topic:${tid}`),
			db.delete(`post:${pid}`),
			db.sortedSetRemove('posts:pid', pid),
			db.delete(`post:${pid}:banned:matches`),
		]);

		// Seed a legacy topic/post containing the soon-to-be-banned word "retroflag"
		await db.setObject(`topic:${tid}`, {
			tid,
			title: 'Legacy topic mentioning retroflag',
			mainPid: pid,
		});
		await db.setObject(`post:${pid}`, {
			pid,
			tid,
			content: 'Body also says retroflag once.',
		});
		await db.sortedSetAdd('posts:pid', Date.now(), pid);

		// Nothing flagged yet
		const initiallyFlagged = await db.getSortedSetRange('posts:flagged:banned', 0, -1);
		assert(!initiallyFlagged.includes(pid), 'Precondition failed: pid already flagged');

		// Add the word AFTER content exists (should trigger retro scan)
		await BannedWords.add('retroflag');

		// Post is marked in global set and per-post matches
		const flagged = await db.getSortedSetRange('posts:flagged:banned', 0, -1);
		assert(flagged.includes(pid), 'Expected pid to be in posts:flagged:banned');

		const matches = await db.getObject(`post:${pid}:banned:matches`);
		assert(matches && matches.retroflag, 'Expected per-post match entry for "retroflag"');

		// Cleanup
		await BannedWords.remove('retroflag');
		await Promise.all([
			db.sortedSetRemove('posts:flagged:banned', pid),
			db.delete(`post:${pid}:banned:matches`),
			db.sortedSetRemove('posts:pid', pid),
			db.delete(`post:${pid}`),
			db.delete(`topic:${tid}`),
		]);
	});
});