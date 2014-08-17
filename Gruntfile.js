/*jshint camelcase: false */
/*global module:false */
module.exports = function(grunt) {
  grunt.initConfig({
    watch: {
      spec: {
        files: ['spec/**/*.js', 'spec/**/*.coffee'],
        tasks: ['spec:generate:specs', 'spec:generate:runner'],
      },
    },
  });

  grunt.registerTask("default", ["watch"]);

  grunt.registerTask('spec:generate:runner', 'Builds spec require file.', function() {
    var specFiles = grunt.file.expand("spec/**/*_spec.js", "spec/**/*_spec.coffee");
    specFiles = specFiles
      .map(function(fileName) {
        return fileName.replace(/\.coffee/, "").replace(/\.js/, "");
      })
      .map(function(fileName) {
        return "require('" + fileName + "');";
      });
    grunt.file.write("spec/runner.js", specFiles.join("\n"));
  });

  grunt.registerTask("spec:generate:specs", "Generates missing specs files", function() {

  });

  grunt.loadNpmTasks('grunt-contrib-watch');

};
