//NOTE: Code is generated in part using GPT 5 but is edited by student 
'use strict';

const db = require('../database');
const pubsub = require('../pubsub');

const ResourcesPage = module.exports; //

let cache = [];
let loaded = false;

// Must be an array of objects than singular list 
ResourcesPage._resources = [
	{ name: '313 Syllabus', description: 'Attached is the syllabus for 313 for Fall 2025!', url: 'https://cmu-313.github.io/syllabus/' },
	{ name: 'Gradescope', description: 'Use this link to submit all assignments!', url: 'https://www.gradescope.com/courses/1086939' },
	{ name: 'Calendar', description: 'Find the class calendar here!', url: 'https://cmu-313.github.io/#class-calendar' },
];


// Here we are reloading the cache from DB 
async function reloadFromDb() {
	const ids = (await db.getSortedSetRevRange('resources:all', 0, -1)) || [];
	const objs = ids.length ? await db.getObjects(ids.map(id => `resource:${id}`)) : [];
	cache = objs.filter(Boolean);
	loaded = true;
}

// initialize the actual resources table here 
ResourcesPage.init = async function () {
	let count;
	if (typeof db.getSortedSetCard === 'function') {
		count = await db.getSortedSetCard('resources:all');
	} else {
		const allIds = await db.getSortedSetRange('resources:all', 0, -1);
		count = allIds.length;
	}

	// migrate hardcoded seed into DB if empty -- GPT from here and below (to make edits as unit tests are developed)
	if (!count) {
		for (const r of ResourcesPage._resources) {
			const id = String(await db.incrObjectField('global', 'nextResourceId'));
			const obj = { id, name: r.name, description: r.description, url: r.url };
			await db.setObject(`resource:${id}`, obj);
			await db.sortedSetAdd('resources:all', Date.now(), id);
		}
	}

	await reloadFromDb();
	// refresh cache across workers
	pubsub.on('meta:resources:reload', reloadFromDb);
};

// returning a shallow copy of the current in-memory list
ResourcesPage.getList = function () {
	return cache.slice();
};

ResourcesPage.load = async function () {
	const ids = await db.getSortedSetRevRange('resources:all', 0, -1) || []; //sorted list of all ids 
	if (ids.length === 0) 
		return [];
	const objs = await db.getObjects(ids.map(id => `resource:${id}`)); //get the objects for a given id 
	return objs.filter(Boolean); //filter out missing or null entries
};


// Same as with the Banned Words 
ResourcesPage.getAll = async function () {
	if (!loaded) {
		await reloadFromDb();
	}
	return cache.slice();
};

ResourcesPage.add = async function ({ name, url, description = '' } = {}) {
	if (name == null || url == null) {
		throw new Error('[[error:invalid-resource]]');
	}

	// Validate like update(): trim for validation, but store original values
	const nameStr = String(name);
	const urlStr = String(url);

	if (!nameStr.trim()) {
		throw new Error('Every Resource MUST have a name. Please enter one to proceed');
	}
	if (!/^https?:\/\//i.test(urlStr.trim())) {
		throw new Error('Each Resource MUST have a valid URL. ');
	}

	const id = String(await db.incrObjectField('global', 'nextResourceId'));
	const obj = {
		id,
		name,
		url,
		description,
	};

	await db.setObject(`resource:${id}`, obj);
	await db.sortedSetAdd('resources:all', Date.now(), id);

	cache.unshift(obj);
	pubsub.publish('meta:resources:reload');
	return obj;
};



ResourcesPage.remove = async function (id) {
	if (id == null) {
		throw new Error('[[error:invalid-resource-id]]');
	}
	const key = `resource:${String(id)}`;
	await db.sortedSetRemove('resources:all', String(id));
	await db.delete(key);
	
	cache = cache.filter(r => r && r.id !== String(id));
	pubsub.publish('meta:resources:reload');

};

ResourcesPage.exists = async function (id) {
	if (id == null) return false;
	const key = `resource:${String(id)}`;
	const obj = await db.getObject(key);  
	return !!(obj && obj.id);
};

// Update Name, URL, or Description 
ResourcesPage.update = async function (id, { name, url, description } = {}, opts = {}) {
	if (id == null) throw new Error('[[error:invalid-resource-id]]');
	const key = `resource:${String(id)}`;
	const existing = await db.getObject(key);
	if (!existing) throw new Error('[[error:resource-not-found]]');
	const next = { ...existing, id: String(id) };
	if (name != null) {
		const n = String(name);
		if (!n) throw new Error('[[error:invalid-name]]');
		next.name = n;
	}
	if (url != null) {
		const u = String(url);
		if (!/^https?:\/\//i.test(u)) throw new Error('[[error:invalid-url]]');
		next.url = u;
	}
	
	if (description != null) {
		next.description = String(description);
	}
	
	await db.setObject(key, next);
	
	if (opts.bumpScore) {
		await db.sortedSetAdd('resources:all', Date.now(), String(id));
	}
	const i = cache.findIndex(r => r && r.id === String(id));
	if (i !== -1) {
		cache[i] = next;
		if (opts.bumpScore) {
			await reloadFromDb();
		}
	} else if (!loaded) {
		await reloadFromDb();
	}
	pubsub.publish('meta:resources:reload');
	return next;
};