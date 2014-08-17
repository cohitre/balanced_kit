var filterCoffeeScript = require('broccoli-coffee');
var compileEs6 = require('broccoli-es6-concatenator');
var staticCompiler = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');
var wrapFiles = require('broccoli-wrap');
var findBowerTrees = require('broccoli-bower');
var filterTemplates = require('broccoli-template');

var handleJs = function(treeName, options) {
  var tree = staticCompiler(treeName, options);
  tree = filterCoffeeScript(tree, {
    bare: true
  });
  return tree;
};

var pickFiles = function(treeName, options) {
  var tree = handleJs(treeName, options);
  tree = filterTemplates(tree, {
    extensions: ['hbs', 'handlebars'],
    compileFunction: 'Ember.Handlebars.compile'
  });
  return tree;
};

// Bower trees
var bowerTrees = mergeTrees(findBowerTrees());

// ./vendor
var vendorSourceTree = "vendor";
vendorSourceTree= pickFiles(vendorSourceTree, {
  srcDir: '/',
  destDir: "vendor"
});

// balanced.js
var balancedJsSourceTree = pickFiles("src", {
  srcDir: '/',
  destDir: 'balanced'
});

balancedJsSourceTree = mergeTrees([
  bowerTrees,
  balancedJsSourceTree
]);

// assets/balanced.js
var lightJs = mergeTrees([balancedJsSourceTree, vendorSourceTree]);
lightJs = compileEs6(lightJs, {
  loaderFile: 'vendor/loader.js',
  ignoredModules: [],
  inputFiles: [
    'balanced/**/*.js'
  ],
  legacyFilesToAppend: [],
  wrapInEval: false,
  outputFile: '/assets/balanced.js'
});

lightJs = wrapFiles(lightJs, {
  wrapper: [
    "(function(){;\n",
    "window.BalancedKit = require('balanced/balanced')['default'];})(this)"
  ]
});

var staticHtml = handleJs("docs", {
  srcDir: "/",
  destDir: "/"
});

// Specs.js
var specsTree = pickFiles("spec", {
  srcDir: '/',
  destDir: "spec"
});

specsTree = filterCoffeeScript(specsTree, {
  bare: true
});

specsTree = mergeTrees([
  balancedJsSourceTree,
  specsTree,
  vendorSourceTree
]);

var specsRunner = pickFiles(specsTree, {
  srcDir: 'spec',
  files: ['index.html', './jasmine/**/*'],
  destDir: 'spec'
});

specsTree = compileEs6(specsTree, {
  loaderFile: 'vendor/loader.js',
  ignoredModules: [],
  inputFiles: [
    'spec/src/**/*.js'
  ],
  legacyFilesToAppend: [
    'spec/runner.js'
  ],
  wrapInEval: false,
  outputFile: '/spec/balanced_specs.js'
});

var bowerTree = mergeTrees(findBowerTrees());

staticHtml = mergeTrees([
  specsRunner,
  staticHtml,
  bowerTree
]);

module.exports = mergeTrees([lightJs, staticHtml, specsTree]);
