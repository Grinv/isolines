module.exports =
  all:
    options:
      sourceMap: true
      sourceMapIncludeSources: true
    files: [{
      expand: true
      cwd: 'tmp/scripts'
      src: '**/*.js'
      dest: 'dist/scripts'
      ext: '.min.js'
    }]
