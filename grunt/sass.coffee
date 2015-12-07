module.exports =
  development:
    options:
      sourceComments: true
    files: [{
      expand: true
      cwd: 'source/styles'
      src: ['application.sass']
      dest: 'build/styles'
      ext: '.css'
    }]
  production:
    files: [{
      expand: true
      cwd: 'source/styles'
      src: ['application.sass']
      dest: 'build/styles'
      ext: '.css'
    }]
