var filterCoffeeScript = require('broccoli-coffee')
var compileEs6 = require('broccoli-es6-concatenator');
var pickFiles = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');
var wrapFiles = require('broccoli-wrap');
var findBowerTrees = require('broccoli-bower');
var filterTemplates = require('broccoli-template')


function preprocess (tree) {
  tree = filterTemplates(tree, {
    extensions: ['hbs', 'handlebars'],
    compileFunction: 'Ember.Handlebars.compile'
  });
  tree = filterCoffeeScript(tree, {
    bare: true
  });
  return tree;
}


var vendorSourceTree = "vendor";
vendorSourceTree= pickFiles(vendorSourceTree, {
  srcDir: '/',
  destDir: "vendor"
});

var balancedJsSourceTree = pickFiles("source", {
  srcDir: '/',
  destDir: 'balanced'
});

balancedJsSourceTree = preprocess(balancedJsSourceTree);

balancedJsSourceTree = mergeTrees([
  balancedJsSourceTree,
  vendorSourceTree
]);

var lightJs = compileEs6(balancedJsSourceTree, {
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

var staticHtml = pickFiles("docs", {
  srcDir: "/",
  destDir: "/"
});

staticHtml = filterCoffeeScript(staticHtml, {
  bare: true
});

var bowerTree = mergeTrees(findBowerTrees());

staticHtml = mergeTrees([
  staticHtml,
  bowerTree
]);

module.exports = mergeTrees([lightJs, staticHtml]);
