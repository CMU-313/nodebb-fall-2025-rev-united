'use strict';

// this forces `require.main.require` to always be relative to this directory
// this allows plugins to use `require.main.require` to reference NodeBB modules
// without worrying about multiple parent modules
// In some environments (e.g., test runners, sandboxes), `require.main` can be undefined.
// Ensure it's set to the current module before accessing its properties.
if (!require.main) {
	require.main = module;
}

if (require.main !== module) {
	require.main.require = function (path) {
		return require(path);
	};
}
