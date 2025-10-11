'use strict';

const db = require('../../database');
const user = require('../../user');
const posts = require('../../posts');
const privileges = require('../../privileges');
const pagination = require('../../pagination');
const helpers = require('../helpers');

module.exports = async function bannedReview(req, res, next) {
	try {
		const [isAdminOrGlobalMod, moderatedCids] = await Promise.all([
			user.isAdminOrGlobalMod(req.uid),
			user.getModeratedCids(req.uid),
		]);

		if (!(isAdminOrGlobalMod || moderatedCids.length)) {
			return helpers.notAllowed(req, res);
		}

		const page = Math.max(1, parseInt(req.query.page, 10) || 1);
		const perPage = 20;
		const start = (page - 1) * perPage;
		const stop = start + perPage - 1;

		const [count, rawPids] = await Promise.all([
			db.sortedSetCard('posts:flagged:banned'),
			db.getSortedSetRevRange('posts:flagged:banned', start, stop),
		]);

		let pids = rawPids || [];
		pids = await privileges.posts.filter('topics:read', pids, req.uid);

		const [summaries, matchObjs] = await Promise.all([
			posts.getPostSummaryByPids(pids, req.uid, { stripTags: true }),
			db.getObjects(pids.map(pid => `post:${pid}:banned:matches`)),
		]);

		const items = summaries.map((post, idx) => ({
			post,
			matches: Object.keys(matchObjs[idx] || {}),
		}));

		const pageCount = Math.max(1, Math.ceil(count / perPage));
		const crumbs = [{ text: '[[pages:banned-review]]' }];

		res.render('banned-review', {
			title: '[[pages:banned-review]]',
			posts: items,
			pagination: pagination.create(page, pageCount, req.query),
			breadcrumbs: helpers.buildBreadcrumbs(crumbs),
		});
	} catch (err) {
		return next(err);
	}
};