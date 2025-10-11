'use strict';
const assert = require('assert');

// 1) Load your DB mock and inject it in place of ../src/database
const db = require('./mocks/databasemock');
const ResourcesPage = require('../src/meta/resources.js');
const privileges = require('../src/privileges');

const bypassPrivs = { skipPrivileges: true, uid: 1 };

describe('Resources Data Layer', () => {
	let originalAdminCan;

	before(() => {
		originalAdminCan = privileges.admin.can;
	});

	before(async () => {
		// Initialize the database mock
		await db.init();
		// Initialize the ResourcesPage module
		await ResourcesPage.init();
	});

	afterEach(() => {
		privileges.admin.can = originalAdminCan;
	});

	after(() => {
		privileges.admin.can = originalAdminCan;
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
		}, bypassPrivs);
		const resources = await ResourcesPage.getAll();
		assert(resources.some(r => r.id === created.id));
	});
		
	//testing update here 
	it('should update a resource', async () => {
		const r = await ResourcesPage.add({
			name: '313 GitHub',
			url: 'https://github.com/CMU-313',
			description: 'Reference our class GitHub',
		}, bypassPrivs);
		const updated = await ResourcesPage.update(r.id, {
			name: '313 FALL 2025 GitHub',
			url: 'https://github.com/CMU-313',
			description: 'Updated GitHub as of Fall 2025!',
		}, bypassPrivs);
		const resources = await ResourcesPage.getAll();
		assert(resources.some(x => x.id === r.id && x.name === '313 FALL 2025 GitHub' && x.description === 'Updated GitHub as of Fall 2025!'));
	});
		
	//testing Remove here 
	it('should remove a resource', async () => {
		const r = await ResourcesPage.add({
			name: 'Test Resources',
			url: 'https://cmu-313.github.io',
		}, bypassPrivs);
		await ResourcesPage.remove(r.id, bypassPrivs);
		const resources = await ResourcesPage.getAll();
		assert(!resources.includes(r.id));
		//assert(resources.length > 0); //ensure that other resources still exist
		//assert(!resources.some(x => x.id === r.id));
	});
		
	//testing the .load function here 

	it('should load resources in the right order', async () => {
		const a = await ResourcesPage.add({ name: 'Test Resource 2', url: 'https://www.reddit.com/r/cmu/comments/fz7ian/17313_foundations_of_software_engineering/' }, bypassPrivs);
		await new Promise(r => setTimeout(r, 5)); //just to ensure that the times dont overlap 
		const b = await ResourcesPage.add({ name: 'Test Resource 3', url: 'https://www.cs.cmu.edu/~ckaestne/17313/2018/' }, bypassPrivs);
		const loaded = await ResourcesPage.load(); 
		assert.strictEqual(loaded[0].id, b.id);
		assert.strictEqual(loaded[1].id, a.id);
	});

	//testing the exists function here 
	it('Return true is the id exists and false otherwise', async () => {
		const existingID = await ResourcesPage.add({ name: 'Existing Resource', url: 'https://www.youtube.com/' }, bypassPrivs);
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

	it('should reject add when caller lacks privilege', async () => {
		privileges.admin.can = async () => false;
		await assert.rejects(
			ResourcesPage.add({ name: 'No Access Resource', url: 'https://example.com/no-access' }, { uid: 2001 }),
			/no-privileges/
		);
	});

	it('should allow add when caller has privilege', async () => {
		const adminUid = 2002;
		privileges.admin.can = async (privilege, uid) => privilege === 'admin:resources:create' && uid === adminUid;
		const created = await ResourcesPage.add({ name: 'Admin Resource', url: 'https://example.com/admin-resource' }, { uid: adminUid });
		assert(created && created.id);
		await ResourcesPage.remove(created.id, bypassPrivs);
	});

	it('should reject update when caller lacks privilege', async () => {
		const resource = await ResourcesPage.add({ name: 'Update Locked', url: 'https://example.com/update-locked' }, bypassPrivs);
		privileges.admin.can = async () => false;
		await assert.rejects(
			ResourcesPage.update(resource.id, { name: 'Should Fail' }, { uid: 2003 }),
			/no-privileges/
		);
		await ResourcesPage.remove(resource.id, bypassPrivs);
	});

	it('should allow update when caller has privilege', async () => {
		const resource = await ResourcesPage.add({ name: 'Update Allowed', url: 'https://example.com/update-allowed' }, bypassPrivs);
		const adminUid = 2004;
		privileges.admin.can = async (privilege, uid) => privilege === 'admin:resources:edit' && uid === adminUid;
		const updated = await ResourcesPage.update(resource.id, { description: 'Updated via admin' }, { uid: adminUid });
		assert.strictEqual(updated.description, 'Updated via admin');
		await ResourcesPage.remove(resource.id, bypassPrivs);
	});

	it('should reject remove when caller lacks privilege', async () => {
		const resource = await ResourcesPage.add({ name: 'Delete Locked', url: 'https://example.com/delete-locked' }, bypassPrivs);
		privileges.admin.can = async () => false;
		await assert.rejects(
			ResourcesPage.remove(resource.id, { uid: 2005 }),
			/no-privileges/
		);
		await ResourcesPage.remove(resource.id, bypassPrivs);
	});

	it('should allow remove when caller has privilege', async () => {
		const resource = await ResourcesPage.add({ name: 'Delete Allowed', url: 'https://example.com/delete-allowed' }, bypassPrivs);
		const adminUid = 2006;
		privileges.admin.can = async (privilege, uid) => privilege === 'admin:resources:delete' && uid === adminUid;
		await ResourcesPage.remove(resource.id, { uid: adminUid });
		const exists = await ResourcesPage.exists(resource.id);
		assert.strictEqual(exists, false);
	});

});






