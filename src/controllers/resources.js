'use strict';

const helpers = require('./helpers');
const Resources = require('../meta/resources');

module.exports = {};

module.exports.get = async function (req, res) {
	const resources = await Resources.getAll();

	res.render('resources', {
		resources: resources,
		title: 'Resources',
		breadcrumbs: helpers.buildBreadcrumbs([
			{
				text: 'Resources',
			},
		]),
	});
};
