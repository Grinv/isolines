module.exports =
  default: [
    'concurrent:common0'
    'concurrent:development0'
    'concurrent:development1'
    'includeSource'
    'browserSync'
    'watch'
  ]

  build: [
    'concurrent:common0'
    'concurrent:production0'
    'concurrent:production1'
    'concurrent:production2'
    'includeSource'
  ]

  serve: ['http-server']

  deploy: ['gh-pages']

  lint: ['concurrent:lint0']
