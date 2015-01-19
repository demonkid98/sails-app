module.exports = function (grunt) {
  grunt.registerTask('buildProd', [
    'test',
    'compileAssets',
    'concat',
    'uglify',
    'cssmin',
    'linkAssetsBuildProd',
    'clean:build',
    'copy:build'
  ]);
};
