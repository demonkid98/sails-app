module.exports = function(grunt) {

  grunt.config.set('mochaTest', {
    test: {
      options: {
        reporter: 'spec',
        quiet: false,
        clearRequireCache: false,
        require: 'coffee-script/register'
      },
      src: ['spec/**/*.{js,coffee}']
    }
  });

  grunt.loadNpmTasks('grunt-mocha-test');
};
