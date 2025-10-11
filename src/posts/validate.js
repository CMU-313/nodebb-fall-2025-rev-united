'use strict';

const bannedWords = require('../banned-words');

// postData: object with at least 'title' and 'content'
// returns: object { allowed: boolean, banned: string[] }
function checkPostDataForBannedContent(postData = {}) {
	const text = `${postData.title || ''} ${postData.content || ''}`;
	const bannedFound = bannedWords.findMatches(text);

	return {
		allowed: bannedFound.length === 0,
		banned: bannedFound,
	};
}

module.exports = {
	checkPostDataForBannedContent,
};