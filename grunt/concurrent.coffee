module.exports =
  options: limit: 3

  devFirst: [
    'clean'
    'coffeelint'
  ]
  devSecond: [
    'sass:dev'
    'coffee:compile'
  ]
  devThird: ['uglify']

  prodFirst: [
    'clean'
    'coffeelint'
  ]
  prodSecond: [
    'sass:prod'
    'coffee:compile'
  ]
  prodThird: ['uglify']

  imgFirst: ['imagemin']
