var filterCoffeeScript = require('broccoli-coffee');
var compileEs6 = require('broccoli-es6-concatenator');
var staticCompiler = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');
var wrapFiles = require('broccoli-wrap');
var findBowerTrees = require('broccoli-bower');
var filterTemplates = require('broccoli-template');
var filterEmblemTemplates = require('broccoli-emblem-compiler');


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
  tree = filterEmblemTemplates(tree, {
    extensions: ['emblem'],
    compileFunction: 'Ember.Handlebars.compile'
  })
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

// assets/balanced.js
var lightJs = mergeTrees([balancedJsSourceTree, vendorSourceTree, bowerTrees]);
lightJs = compileEs6(lightJs, {
  loaderFile: 'vendor/loader.js',
  ignoredModules: [],
  inputFiles: [
    'balanced/**/*.js'
  ],
  wrapInEval: false,
  outputFile: '/assets/balanced.js'
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

module.exports = mergeTrees([lightJs, specsTree, staticHtml, bowerTrees]);
