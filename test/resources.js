'use strict';
const assert = require('assert');

// 1) Load your DB mock and inject it in place of ../src/database
const db = require('./mocks/databasemock');
const ResourcesPage = require('../src/meta/resources.js');

describe('Resources Data Layer', () => {
	before(async () => {
		// Initialize the database mock
		await db.init();
		// Initialize the ResourcesPage module
		await ResourcesPage.init();
	});

	//testing init here 
	it('should migrate hardcoded resources on init', async () => {
		const resources = await ResourcesPage.getAll();
		assert(resources.length > 0);
		assert(resources.some(r => r.name.includes('Syllabus')));
	});
		
	//testing add here 
	it('should add a new resource', async () => {
		const created = await ResourcesPage.add({
			name: 'Course Website',
			url: 'https://cmu-313.github.io/',
			description: 'Check out the website here',
		});
		const resources = await ResourcesPage.getAll();
		assert(resources.some(r => r.id === created.id));
	});
		
	//testing update here 
	it('should update a resource', async () => {
		const r = await ResourcesPage.add({
			name: '313 GitHub',
			url: 'https://github.com/CMU-313',
			description: 'Reference our class GitHub',
		});
		const updated = await ResourcesPage.update(r.id, {
			name: '313 FALL 2025 GitHub',
			url: 'https://github.com/CMU-313',
			description: 'Updated GitHub as of Fall 2025!',
		});
		const resources = await ResourcesPage.getAll();
		assert(resources.some(x => x.id === r.id && x.name === '313 FALL 2025 GitHub' && x.description === 'Updated GitHub as of Fall 2025!'));
	});
		
	//testing Remove here 
	it('should remove a resource', async () => {
		const r = await ResourcesPage.add({
			name: 'Test Resources',
			url: 'https://cmu-313.github.io/#class-calendar',
		});
		await ResourcesPage.remove(r.id);
		const resources = await ResourcesPage.getAll();
		assert(!resources.includes(r.id));
		//assert(resources.length > 0); //ensure that other resources still exist
		//assert(!resources.some(x => x.id === r.id));
	});
		
	//testing the .load function here 

	it('should load resources in the right order', async () => {
		const a = await ResourcesPage.add({ name: 'Test Resource 2', url: 'https://www.reddit.com/r/cmu/comments/fz7ian/17313_foundations_of_software_engineering/' });
		await new Promise(r => setTimeout(r, 5)); //just to ensure that the times dont overlap 
		const b = await ResourcesPage.add({ name: 'Test Resource 3', url: 'https://www.cs.cmu.edu/~ckaestne/17313/2018/' });
		const loaded = await ResourcesPage.load(); 
		assert.strictEqual(loaded[0].id, b.id);
		assert.strictEqual(loaded[1].id, a.id);
	});

	//testing the exists function here 
	it('Return true is the id exists and false otherwise', async () => {
		const existingID = await ResourcesPage.add({ name: 'Existing Resource', url: 'https://www.youtube.com/' });
		const checkTrue = await ResourcesPage.exists(existingID.id);
		const checkFalse = await ResourcesPage.exists('1000000'); 
		assert.strictEqual(checkTrue, true);
		assert.strictEqual(checkFalse, false);
	});


	//testing getList below
	it('getList() returns a shallow copy of the current in-memory list', async () => {
		const list = ResourcesPage.getList();              
		const all = await ResourcesPage.getAll();   
		assert.deepStrictEqual(list, all, 'getList must match getAll');
	});
});






