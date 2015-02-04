/**
 * Copy files and folders.
 *
 * ---------------------------------------------------------------
 *
 * # dev task config
 * Copies all directories and files, exept coffescript and less fiels, from the sails
 * assets folder into the .tmp/public directory.
 *
 * # build task config
 * Copies all directories nd files from the .tmp/public directory into a www directory.
 *
 * For usage docs see:
 *   https://github.com/gruntjs/grunt-contrib-copy
 */
module.exports = function(grunt) {

  grunt.config.set('copy', {
    dev: {
      files: [{
        expand: true,
        cwd: './assets',
        src: ['**/*.!(coffee|less)'],
        dest: '.tmp/public'
      }, { // vendor js
        expand: true,
        flatten: true,
        cwd: './bower_components',
        src: [
          'jquery/dist/jquery.js',
          'foundation/js/foundation.js',
          'modernizr/modernizr.js',
          'underscore/underscore.js',
          'backbone/backbone.js'
        ],
        dest: '.tmp/public/js/dependencies'
      }, { // vendor css
        expand: true,
        flatten: true,
        cwd: './bower_components',
        src: [
          'foundation/css/{normalize,foundation}.css?(.map)',
          'foundation-icon-fonts/foundation-icons.css'
        ],
        dest: '.tmp/public/styles/dependencies'
      }, { // vendor fonts
        expand: true,
        flatten: true,
        cwd: './bower_components',
        src: ['foundation-icon-fonts/foundation-icons.{eot,svg,ttf,woff}'],
        dest: '.tmp/public/fonts'
      }]
    },
    build: {
      files: [{
        expand: true,
        cwd: '.tmp/public',
        src: ['**/*'],
        dest: 'www'
      }]
    }
  });

  grunt.loadNpmTasks('grunt-contrib-copy');
};
