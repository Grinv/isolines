module.exports =
  development:
    options:
      processors: [require('autoprefixer') browsers: 'last 2 versions']
    src: 'build/styles/**/*.css'
  production:
    options:
      processors: [
        require('autoprefixer') browsers: 'last 2 versions'
        require('cssnano')
      ]
    src: 'build/styles/**/*.css'
  vendor:
    options:
      processors: [require('cssnano')]
    src: 'build/vendor/styles/**/*.css'
