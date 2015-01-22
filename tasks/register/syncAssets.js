module.exports = function (grunt) {
  grunt.registerTask('syncAssets', [
    'jade:dev',
    'jst:dev',
    'less:dev',
    'sync:dev',
    'coffee:dev'
  ]);
};
