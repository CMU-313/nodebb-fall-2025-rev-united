'use strict';

// TODO: Uncomment these imports when implementing database storage
// const db = require('../database');
// const pubsub = require('../pubsub');

const BannedWords = module.exports;

// Hardcoded list of banned words for first sprint
BannedWords._words = [
	'spam',
	'badword',
	'inappropriate',
	'offensive',
	'hate',
	'abuse',
	// Add more words as needed
];

// TODO: Implement database-driven banned words management
// When ready to move from hardcoded to dynamic banned words:
// 1. Uncomment the db and pubsub imports at the top
// 2. Implement load() function to retrieve words from database and populate _words array
// 3. Implement save() function to store words to database and notify other instances
// 4. Implement get() function to retrieve raw words string from database
// 5. Set up pubsub listener to reload when words are updated
// 6. Replace hardcoded _words array with database-driven approach

BannedWords.getList = function () {
	return BannedWords._words;
};