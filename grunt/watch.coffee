module.exports =
  options:
    spawn: false
    livereload: true

  scripts:
    files: ['src/scripts/*.coffee']
    tasks: [
      'coffeelint'
      'coffee:compile'
      'uglify'
    ]

  styles:
    files: ['src/styles/*.sass']
    tasks: ['sass:dev']
