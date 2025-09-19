'use strict';

function checkPostDataForBannedContent(postData) {
	const text = [postData && postData.title, postData && postData.content]
		.filter(v => typeof v === 'string' && v.trim())
		.join(' ')
		.toLowerCase();

	const keywords = ['sensitive'];
	const hits = keywords.filter(k => text.includes(k.toLowerCase()));

	return hits.length ? { allowed: false, banned: hits } : { allowed: true, banned: [] };
}

module.exports = {
	checkPostDataForBannedContent,
};
