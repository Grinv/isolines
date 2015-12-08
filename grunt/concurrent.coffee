module.exports =
  lint0: [
    'coffeelint'
    'sasslint'
  ]

  common0: [
    'clean'
    'lint'
  ]
  development0: [
    'bower:development'
    'imagemin'
    'coffeescript_concat'
    'sass:development'
  ]
  development1: [
    'coffee:development'
    'postcss:development'
  ]

  production0: [
    'bower:production'
    'imagemin'
    'coffeescript_concat'
  ]
  production1: [
    'postcss:vendor'
    'uglify:vendor'
    'coffee:production'
    'sass:production'
  ]
  production2: [
    'uglify'
    'postcss:production'
  ]
