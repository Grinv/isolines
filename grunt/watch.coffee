module.exports =
  scripts:
    files: ['source/scripts/**/*.coffee']
    tasks: [
      'coffeelint'
      'coffeescript_concat'
      'coffee:development'
    ]
  styles:
    files: ['source/styles/**/*.sass']
    tasks: [
      'sasslint'
      'sass:development'
      'postcss:development'
    ]
  images:
    files: ['source/images/**/*.{png,jpg,gif}']
    tasks: ['imagemin']
  added:
    files: [
      'source/styles/**/*.sass'
      'source/scripts/**/*.coffee'
    ]
    tasks: ['includeSource']
    options:
      event: ['added']
  app:
    files: ['source/index.html']
    tasks: ['includeSource']
