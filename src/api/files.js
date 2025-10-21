'use strict';

const fs = require('fs').promises;

const filesApi = module.exports;

// path assertion and traversal guarding logic is in src/middleware/assert.js

//testing VM CI

filesApi.delete = async (_, { path }) => await fs.unlink(path);

filesApi.createFolder = async (_, { path }) => await fs.mkdir(path);
