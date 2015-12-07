module.exports =
  default: [
    'clean'
    'bower:development'
    'lint'
    'coffeescript_concat'
    'coffee:development'
    'imagemin'
    'sass:development'
    'postcss:development'
    'includeSource'
    'browserSync'
    'watch'
  ]

  build: [
    'clean'
    'bower:production'
    'postcss:vendor'
    'uglify:vendor'
    'lint'
    'coffeescript_concat'
    'coffee:production'
    'uglify'
    'imagemin'
    'sass:production'
    'postcss:production'
    'includeSource'
    'realFavicon'
  ]

  serve: [
    'http-server'
  ]

  deploy: ['gh-pages']

  lint: [
    'coffeelint'
    'sasslint'
  ]
