'use strict';

const meta = require('../meta');
const db = require('../database');
const plugins = require('../plugins');
const user = require('../user');
const topics = require('../topics');
const categories = require('../categories');
const groups = require('../groups');
const privileges = require('../privileges');
const activitypub = require('../activitypub');
const utils = require('../utils');

module.exports = function (Posts) {
	Posts.create = async function (data) {
		// This is an internal method, consider using Topics.reply instead
		const { uid, tid, _activitypub, sourceContent } = data;
		const content = data.content.toString();
		const timestamp = data.timestamp || Date.now();
		const isMain = data.isMain || false;

		if (!uid && parseInt(uid, 10) !== 0) {
			throw new Error('[[error:invalid-uid]]');
		}

		if (data.toPid) {
			await checkToPid(data.toPid, uid);
		}

		if (data.linkedThreadIds) {
			await checkLinkedThreadIds(data.linkedThreadIds, uid);
		}

		const pid = data.pid || await db.incrObjectField('global', 'nextPid');
		let postData = { pid, uid, tid, content, sourceContent, timestamp };

		if (data.toPid) {
			postData.toPid = data.toPid;
		}
		if (data.linkedThreadIds && Array.isArray(data.linkedThreadIds)) {
			// Convert array to comma-separated string for storage
			postData.linkedThreadIds = data.linkedThreadIds.join(',');
		}
		if (data.ip && meta.config.trackIpPerPost) {
			postData.ip = data.ip;
		}
		if (data.handle && !parseInt(uid, 10)) {
			postData.handle = data.handle;
		}
		if (_activitypub) {
			if (_activitypub.url) {
				postData.url = _activitypub.url;
			}
			if (_activitypub.audience) {
				postData.audience = _activitypub.audience;
			}
		}

		// Rewrite emoji references to inline image assets
		if (_activitypub && _activitypub.tag && Array.isArray(_activitypub.tag)) {
			_activitypub.tag
				.filter(tag => tag.type === 'Emoji' &&
					tag.icon && tag.icon.type === 'Image')
				.forEach((tag) => {
					if (!tag.name.startsWith(':')) {
						tag.name = `:${tag.name}`;
					}
					if (!tag.name.endsWith(':')) {
						tag.name = `${tag.name}:`;
					}

					postData.content = postData.content.replace(new RegExp(tag.name, 'g'), `<img class="not-responsive emoji" src="${tag.icon.url}" title="${tag.name}" />`);
				});
		}

		({ post: postData } = await plugins.hooks.fire('filter:post.create', { post: postData, data: data }));
		await db.setObject(`post:${postData.pid}`, postData);

		const topicData = await topics.getTopicFields(tid, ['cid', 'pinned']);
		postData.cid = topicData.cid;

		await Promise.all([
			db.sortedSetAdd('posts:pid', timestamp, postData.pid),
			utils.isNumber(pid) ? db.incrObjectField('global', 'postCount') : null,
			user.onNewPostMade(postData),
			topics.onNewPostMade(postData),
			categories.onNewPostMade(topicData.cid, topicData.pinned, postData),
			groups.onNewPostMade(postData),
			addReplyTo(postData, timestamp),
			Posts.uploads.sync(postData.pid),
		]);

		const result = await plugins.hooks.fire('filter:post.get', { post: postData, uid: data.uid });
		result.post.isMain = isMain;
		plugins.hooks.fire('action:post.save', { post: { ...result.post, _activitypub } });
		return result.post;
	};

	async function addReplyTo(postData, timestamp) {
		if (!postData.toPid) {
			return;
		}
		await Promise.all([
			db.sortedSetAdd(`pid:${postData.toPid}:replies`, timestamp, postData.pid),
			db.incrObjectField(`post:${postData.toPid}`, 'replies'),
		]);
	}

	async function checkToPid(toPid, uid) {
		if (!utils.isNumber(toPid) && !activitypub.helpers.isUri(toPid)) {
			throw new Error('[[error:invalid-pid]]');
		}

		const [toPost, canViewToPid] = await Promise.all([
			Posts.getPostFields(toPid, ['pid', 'deleted']),
			privileges.posts.can('posts:view_deleted', toPid, uid),
		]);
		const toPidExists = !!toPost.pid;
		if (!toPidExists || (toPost.deleted && !canViewToPid)) {
			throw new Error('[[error:invalid-pid]]');
		}
	}

	async function checkLinkedThreadIds(linkedThreadIds, uid) {
		if (!Array.isArray(linkedThreadIds)) {
			throw new Error('[[error:invalid-data]]');
		}

		if (linkedThreadIds.length === 0) {
			return; // Empty array is valid
		}

		// Validate each thread ID is a number
		for (const threadId of linkedThreadIds) {
			if (!utils.isNumber(threadId)) {
				throw new Error('[[error:invalid-thread-id]]');
			}
		}

		// Check existence and permissions for all thread IDs
		const [threadsExist, canViewThreads] = await Promise.all([
			topics.exists(linkedThreadIds),
			Promise.all(linkedThreadIds.map(threadId => privileges.topics.can('topics:read', threadId, uid))),
		]);

		// Check if any threads don't exist
		const existsArray = Array.isArray(threadsExist) ? threadsExist : [threadsExist];
		for (let i = 0; i < linkedThreadIds.length; i++) {
			if (!existsArray[i]) {
				throw new Error('[[error:no-topic]]');
			}
			if (!canViewThreads[i]) {
				throw new Error('[[error:no-privileges]]');
			}
		}
	}
};
