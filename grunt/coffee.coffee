module.exports =
  compile:
    expand: true
    cwd: 'src/scripts'
    src: ['**/*.coffee']
    dest: 'tmp/scripts'
    ext: '.js'
    options:
      bare: true
      preserve_dirs: true

