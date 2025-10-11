'use strict';

const helpers = require('./helpers');
const Resources = require('../meta/resources');

const controller = module.exports;

controller.get = async function (req, res) {
	const resources = await Resources.getAll();

	res.render('resources', {
		title: '[[global:resources]]',
		resources: resources,
		breadcrumbs: helpers.buildBreadcrumbs([{ text: '[[global:resources]]' }]),
	});
};
