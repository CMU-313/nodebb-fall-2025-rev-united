'use strict';

const nconf = require('nconf');
const helpers = require('./helpers');
const Resources = require('../meta/resources');
const privileges = require('../privileges');
const middleware = require('../middleware');
const translator = require('../translator');

const controller = module.exports;

controller.get = async function (req, res) {
	const [resources, canAdd] = await Promise.all([
		Resources.getAll(),
		privileges.admin.can('admin:resources:create', req.uid),
	]);

	res.render('resources', {
		title: '[[global:resources]]',
		resources: resources,
		canAddResource: canAdd,
		breadcrumbs: helpers.buildBreadcrumbs([{ text: '[[global:resources]]' }]),
	});
};

async function ensureCreatePrivilege(req, res) {
	if (!req.uid) {
		await helpers.notAllowed(req, res);
		return false;
	}

	const allowed = await privileges.admin.can('admin:resources:create', req.uid);
	if (allowed) {
		return true;
	}

	await helpers.notAllowed(req, res);
	return false;
}

function buildCreateContext({ values = {}, error } = {}) {
	return {
		title: '[[global:resources-add]]',
		breadcrumbs: helpers.buildBreadcrumbs([
			{ text: '[[global:resources]]', url: 'resources' },
			{ text: '[[global:resources-add]]' },
		]),
		values: {
			name: values.name || '',
			description: values.description || '',
			url: values.url || '',
		},
		error: typeof error === 'string' && error ? error : null,
	};
}

controller.getCreate = async function (req, res) {
	if (!(await ensureCreatePrivilege(req, res))) {
		return;
	}

	res.render('resources-new', buildCreateContext());
};

controller.postCreate = async function (req, res) {
	if (!(await ensureCreatePrivilege(req, res))) {
		return;
	}

	const { name, description, url } = req.body || {};

	try {
		await Resources.add({ name, description, url }, { uid: req.uid });
		const relativePath = nconf.get('relative_path') || '';
		return res.redirect(303, `${relativePath}/resources`);
	} catch (err) {
		await middleware.buildHeaderAsync(req, res);
		let message = err && err.message ? err.message : err;
		const config = res.locals.config || {};
		const language = config.userLang || config.defaultLang;
		if (!message || typeof message !== 'string') {
			message = await translator.translate('[[error:unknown-error]]', language);
		} else if (message.startsWith('[[')) {
			message = await translator.translate(message, language);
		}

		return res.status(400).render('resources-new', buildCreateContext({
			values: { name, description, url },
			error: message,
		}));
	}
};
