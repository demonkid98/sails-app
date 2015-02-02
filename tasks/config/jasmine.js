module.exports = function(grunt) {
  var scriptPath = '.tmp/public/js/'
  var builtPattern = [scriptPath + '/**/*.js', '!' + scriptPath + '/dependencies/**/*.js']

  grunt.config.set('jasmine', {
    dev: {
      src: scriptPath,
      options: {
        vendor: [
          scriptPath + '/jquery.js',
          scriptPath + '/underscore.js',
          scriptPath + '/backbone.js'
        ],
        specs: scriptPath + 'spec/**/*_spec.js'
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-jasmine');
};
