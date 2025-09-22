//NOTE: Code is generated in part using GPT 5 but is edited by student 
'use strict';

const db = require('../database');
const pubsub = require('../pubsub');

const Resources = module.exports;

let cache = [];
let loaded = false;

// To change these later - just examples for now (Added real examples)
Resources._resources = [
	{ name: '313 Syllabus', description: 'Attached is the syllabus for 313 for Fall 2025!', url: 'https://cmu-313.github.io/syllabus/' },
	{ name: 'Gradescope', description: 'Use this link to submit all assignments!', url: 'https://www.gradescope.com/courses/1086939' },
	{ name: 'Calendar', description: 'Find the class calendar here!', url: 'https://cmu-313.github.io/#class-calendar' },
    {name: 'Website', description: 'Find the Webiste linked here', url: 'https://cmu-313.github.io/'}
];

// Here we are reloading the cache from DB 
async function reloadFromDb() {
	const ids = (await db.getSortedSetRevRange('resources:all', 0, -1)) || [];
	const objs = ids.length ? await db.getObjects(ids.map(id => `resource:${id}`)) : [];
	cache = objs.filter(Boolean);
	loaded = true;
}

// initialize the actual resources table here 
Resources.init = async function () {
	let count;
	if (typeof db.getSortedSetCard === 'function') {
		count = await db.getSortedSetCard('resources:all');
	} else {
		const allIds = await db.getSortedSetRange('resources:all', 0, -1);
		count = allIds.length;
	}

	// migrate hardcoded seed into DB if empty -- GPT from here and below (to make edits as unit tests are developed)
	if (!count) {
		for (const r of Resources._resources) {
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
Resources.getList = function () {
	return cache.slice();
};

// Ensures cache is initialized once, then returns it
Resources.getAll = async function () {
	if (!loaded) {
		await reloadFromDb();
	}
	return cache.slice();
};
