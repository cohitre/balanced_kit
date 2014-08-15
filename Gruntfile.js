/*jshint camelcase: false */
/*global module:false */
module.exports = function(grunt) {
  grunt.initConfig({
    jasmine: {
      components: {
        src: [
          'components/*js'
        ],
        options: {
          specs: 'tests/spec/*Spec.js',
          keepRunner : true,
          //helpers: 'test/spec/*.js'
        }
      }
    }
  });

  grunt.registerTask('travis', ['jasmine']);
};
