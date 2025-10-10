'use strict';

const meta = require('../meta');
const analytics = require('../analytics');
const privileges = require('../privileges');
const groups = require('../groups');
const bannedWords = require('../banned-words');
const adminApi = module.exports;

// Settings
adminApi.updateSetting = async (caller, { setting, value }) => {
	const ok = await privileges.admin.can('admin:settings', caller.uid);
	if (!ok) {
		throw new Error('[[error:no-privileges]]');
	}

	await meta.configs.set(setting, value);
};

adminApi.getAnalyticsKeys = async () => {
	const keys = await analytics.getKeys();

	// Sort keys alphabetically
	return keys.sort((a, b) => (a < b ? -1 : 1));
};

adminApi.getAnalyticsData = async (caller, { set, until, amount, units }) => {
	// Default returns views from past 24 hours, by hour
	if (!amount) {
		if (units === 'days') {
			amount = 30;
		} else {
			amount = 24;
		}
	}
	const getStats = units === 'days' ? analytics.getDailyStatsForSet : analytics.getHourlyStatsForSet;
	return await getStats(`analytics:${set}`, parseInt(until, 10) || Date.now(), amount);
};

adminApi.listGroups = async () => {
	// N.B. Returns all groups, even hidden. Beware of leakage.
	// Access control handled at controller level

	const payload = await groups.getNonPrivilegeGroups('groups:createtime', 0, -1, { ephemeral: false });
	return { groups: payload };
};

// Banned Words
adminApi.getBannedWords = async function (caller) {
	if (!await privileges.admin.can('admin:settings', caller.uid)) {
		throw new Error('[[error:no-privileges]]');
	}
	return await bannedWords.getAll();
};

adminApi.addBannedWord = async function (caller, data) {
	if (!await privileges.admin.can('admin:settings', caller.uid)) {
		throw new Error('[[error:no-privileges]]');
	}
	if (!data.word) {
		throw new Error('[[error:invalid-data]]');
	}
	await bannedWords.add(data.word);
};

adminApi.removeBannedWord = async function (caller, data) {
	if (!await privileges.admin.can('admin:settings', caller.uid)) {
		throw new Error('[[error:no-privileges]]');
	}
	if (!data.word) {
		throw new Error('[[error:invalid-data]]');
	}
	await bannedWords.remove(data.word);
};

adminApi.updateBannedWord = async function (caller, data) {
	if (!await privileges.admin.can('admin:settings', caller.uid)) {
		throw new Error('[[error:no-privileges]]');
	}
	if (!data.oldWord || !data.newWord) {
		throw new Error('[[error:invalid-data]]');
	}
	await bannedWords.update(data.oldWord, data.newWord);
};
