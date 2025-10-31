// @ts-check
/** @type {import('@stryker-mutator/api/core').PartialStrykerOptions} */
const config = {
  // Generated via `stryker init` and adjusted for NodeBB
  packageManager: 'npm',
  reporters: ['html', 'clear-text', 'progress'],
  testRunner: 'mocha',
  coverageAnalysis: 'perTest',
  mochaOptions: {
    // Start with simplest tests and build up gradually
    spec: [
      'test/batch.js',
      'test/pagination.js',
      'test/password.js',
      'test/rewards.js',
    ],
    // No require needed - require-main.js now handles undefined require.main
  },
  mutate: [
    // Only mutate files that are directly tested by our spec
    'src/batch.js',
    'src/pagination.js',
    'src/password.js',
  ],
  ignoreStatic: true,  // Skip static mutants that can't be killed by tests
  ignorePatterns: [
    // Minimal ignores - only what causes EISDIR or is truly unnecessary
    'build/public/**',
    'build/export/**',
    'logs/**',
    'coverage/**',
    '.nyc_output/**',
    'node_modules/**',
  ],
  thresholds: {
    high: 80,
    low: 60,
    break: 50,
  },
};

export default config;
