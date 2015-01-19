module.exports = function (grunt) {
  grunt.registerTask('build', [
    'test',
    'compileAssets',
    'linkAssetsBuild',
    'clean:build',
    'copy:build'
  ]);
};
