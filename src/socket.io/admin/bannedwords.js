'use strict';

const user = require('../../user');
// TODO: Uncomment when implementing database functionality
// const meta = require('../../meta');
// const events = require('../../events');

const SocketBannedWords = module.exports;

SocketBannedWords.save = async function (socket, words) {
	const isAdminOrGlobalMod = await user.isAdminOrGlobalMod(socket.uid);
	if (!isAdminOrGlobalMod) {
		throw new Error('[[error:no-privileges]]');
	}

	// TODO: Implement banned words saving to database
	// When implementing: uncomment meta and events imports, call meta.bannedwords.save(words),
	// and log the event with events.log() for admin audit trail
	throw new Error(`Banned words management not yet implemented - using hardcoded list. Received: ${words}`);
};

SocketBannedWords.get = async function (socket) {
	const isAdminOrGlobalMod = await user.isAdminOrGlobalMod(socket.uid);
	if (!isAdminOrGlobalMod) {
		throw new Error('[[error:no-privileges]]');
	}

	// TODO: Implement banned words retrieval from database
	// When implementing: return meta.bannedwords.get() to allow admin interface
	// to display current banned words for editing in the admin panel
	throw new Error('Banned words management not yet implemented - using hardcoded list');
};

require('../../promisify')(SocketBannedWords);