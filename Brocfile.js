/* global require, module */
var pickFiles = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');

var EmberAddon = require('ember-cli/lib/broccoli/ember-addon');

var app = new EmberAddon();
app.hinting = false;

var jasmineFiles = pickFiles('vendor', {
  srcDir: '/jasmine',
  files: [
    'jasmine.css',
    'jasmine_favicon.png',
    'jasmine.js',
    'jasmine-html.js',
    'boot.js'
  ],
  destDir: '/assets/jasmine'
});

var fullTree = mergeTrees([app.toTree(), jasmineFiles]);
module.exports = fullTree;
