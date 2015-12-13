module.exports =
  default: [
    'notify:development'
    'concurrent:common0'
    'concurrent:development0'
    'concurrent:development1'
    'includeSource'
    'browserSync'
    'watch'
  ]

  build: [
    'notify:build'
    'concurrent:common0'
    'concurrent:production0'
    'concurrent:production1'
    'concurrent:production2'
    'includeSource'
    'realFavicon'
    'notify:success'
  ]

  serve: ['http-server']

  deploy: ['gh-pages']

  lint: ['concurrent:lint0']
