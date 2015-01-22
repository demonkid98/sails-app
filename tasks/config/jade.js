module.exports = function(grunt) {

  grunt.config.set('jade', {
    dev: {
      files: [{
        src: '**/*.jade',
        ext: '.html',
        dest: '.tmp/public/templates',
        cwd: 'assets/templates',
        expand: true
      }]
    }
  });

  grunt.loadNpmTasks('grunt-contrib-jade');
};
