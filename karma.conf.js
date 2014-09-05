module.exports = function(config) {
  config.set({
    frameworks: ['jasmine'],
    files: [
      'bower_components/moment/moment.js',
      'bower_components/underscore/underscore.js',
      'bower_components/rsvp/rsvp.js',
      'bower_components/jquery/dist/jquery.js',
      'bower_components/handlebars/handlebars.js',
      'bower_components/ember/ember.js',
      'build/assets/**/*.js',
      'build/spec/**/*_helper.js',
      'build/spec/**/*_spec.js',
    ],
    reporters: ['dots', 'coverage'],
    preprocessors: {
      'build/assets/**/*.js': 'coverage'
    },
    coverageReporter: {
      reporters: [{
        type: 'html',
        dir: 'coverage/'
      }, {
        type: 'text-summary'
      }]
    },
  });
};
