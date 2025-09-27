'use strict';

const meta = require('../meta');

// postData: object with at least 'title' and 'content'
// returns: object { allowed: boolean, banned: string[] }
function checkPostDataForBannedContent(postData) {
	const bannedWords = meta.bannedwords.getList();
	const bannedFound = [];
	const text = `${postData.title || ''} ${postData.content || ''}`.toLowerCase();

	for (const word of bannedWords) {
		const escaped = escapeForRegex(word);
		if (!escaped) {
			continue;
		}
		const regex = new RegExp(`\\b${escaped}\\b`, 'i');
		if (regex.test(text)) {
			bannedFound.push(word);
		}
	}

	return {
		allowed: (bannedFound.length === 0),
		banned: bannedFound,
	};
}

module.exports = {
	checkPostDataForBannedContent,
};

function escapeForRegex(word) {
	if (!word) {
		return '';
	}
	return word.replace(/[.*+?^${}()|[\]\\]/g, '\\$&').toLowerCase();
}
