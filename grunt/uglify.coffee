module.exports =
  options:
    screwIE8: true
  production:
    files: [{
      expand: true
      cwd: '.tmp/scripts'
      src: '**/*.js'
      dest: 'build/scripts'
      ext: '.min.js'
    }]
  vendor:
    files: [{
      expand: true
      cwd: '.tmp/vendor/scripts'
      src: '**/*.js'
      dest: 'build/vendor/scripts'
      ext: '.min.js'
    }]
