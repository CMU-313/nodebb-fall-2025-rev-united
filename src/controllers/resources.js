'use strict';

const nconf = require('nconf');
const helpers = require('./helpers');
const Resources = require('../meta/resources');
const privileges = require('../privileges');
const middleware = require('../middleware');
const translator = require('../translator');

const controller = module.exports;

async function buildListContext(req, overrides = {}) {
	const [resources, canAdd, canEdit, canDelete] = await Promise.all([
		Resources.getAll(),
		privileges.admin.can('admin:resources:create', req.uid),
		privileges.admin.can('admin:resources:edit', req.uid),
		privileges.admin.can('admin:resources:delete', req.uid),
	]);
	const effectiveCanEdit = canEdit || canAdd;
	return {
		title: '[[global:resources]]',
		resources,
		canAddResource: canAdd,
		canEditResource: effectiveCanEdit,
		canDeleteResource: canDelete,
		breadcrumbs: helpers.buildBreadcrumbs([{ text: '[[global:resources]]' }]),
		...overrides,
	};
}

controller.get = async function (req, res) {
	const context = await buildListContext(req);
	res.render('resources', context);
};

async function ensurePrivilege(req, res, privilege) {
	if (!req.uid) {
		await helpers.notAllowed(req, res);
		return false;
	}

	const privilegesToCheck = Array.isArray(privilege) ? privilege : [privilege];
	const results = await Promise.all(privilegesToCheck.map(name => privileges.admin.can(name, req.uid)));
	if (results.some(Boolean)) {
		return true;
	}

	await helpers.notAllowed(req, res);
	return false;
}

function buildFormContext({
	values = {},
	pageTitle = '[[global:resources-add]]',
	submitLabel = '[[global:resources-add]]',
	formAction,
	cancelUrl,
	error,
} = {}) {
	const relativePath = nconf.get('relative_path') || '';
	const normalizedCancel = cancelUrl || `${relativePath}/resources`;
	const normalizedAction = formAction || `${relativePath}/resources/new`;
	return {
		title: pageTitle,
		pageTitle,
		submitLabel,
		formAction: normalizedAction,
		cancelUrl: normalizedCancel,
		breadcrumbs: helpers.buildBreadcrumbs([
			{ text: '[[global:resources]]', url: 'resources' },
			{ text: pageTitle },
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
	if (!(await ensurePrivilege(req, res, 'admin:resources:create'))) {
		return;
	}

	res.render('resources-new', buildFormContext());
};

controller.postCreate = async function (req, res) {
	if (!(await ensurePrivilege(req, res, 'admin:resources:create'))) {
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

		return res.status(400).render('resources-new', buildFormContext({
			values: { name, description, url },
			error: message,
		}));
	}
};

async function findResourceById(id) {
	if (id == null) {
		return null;
	}
	const resources = await Resources.getAll();
	const needle = String(id);
	return resources.find(resource => resource && resource.id === needle) || null;
}

controller.getEdit = async function (req, res) {
	if (!(await ensurePrivilege(req, res, ['admin:resources:edit', 'admin:resources:create']))) {
		return;
	}

	const { resourceId } = req.params;
	const resource = await findResourceById(resourceId);
	const relativePath = nconf.get('relative_path') || '';

	if (!resource) {
		let message = '[[error:resource-not-found]]';
		try {
			const config = res.locals.config || {};
			const language = config.userLang || config.defaultLang;
			message = await translator.translate(message, language);
		} catch (err) {
			// ignore translation failures
		}

		return res.render('resources-new', buildFormContext({
			values: { name: '', description: '', url: '' },
			pageTitle: '[[global:resources-edit]]',
			submitLabel: '[[global:save-changes]]',
			formAction: `${relativePath}/resources/${resourceId}/edit`,
			error: message,
		}));
	}

	res.render('resources-new', buildFormContext({
		values: resource,
		pageTitle: '[[global:resources-edit]]',
		submitLabel: '[[global:save-changes]]',
		formAction: `${relativePath}/resources/${resource.id}/edit`,
	}));
};

controller.postEdit = async function (req, res) {
	if (!(await ensurePrivilege(req, res, ['admin:resources:edit', 'admin:resources:create']))) {
		return;
	}

	const { resourceId } = req.params;
	const { name, description, url } = req.body || {};

	try {
		await Resources.update(resourceId, { name, description, url }, { uid: req.uid });
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

		const resource = await findResourceById(resourceId) || { id: resourceId };
		const relativePath = nconf.get('relative_path') || '';
		return res.status(400).render('resources-new', buildFormContext({
			values: {
				id: resource.id,
				name: name,
				description: description,
				url: url,
			},
			pageTitle: '[[global:resources-edit]]',
			submitLabel: '[[global:save-changes]]',
			formAction: `${relativePath}/resources/${resourceId}/edit`,
			error: message,
		}));
	}
};

controller.postDelete = async function (req, res) {
	if (!(await ensurePrivilege(req, res, ['admin:resources:delete', 'admin:resources:edit', 'admin:resources:create']))) {
		return;
	}

	const { resourceId } = req.params;

	try {
		await Resources.remove(resourceId, { uid: req.uid });
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

		const context = await buildListContext(req, { error: message });
		return res.status(400).render('resources', context);
	}
};
