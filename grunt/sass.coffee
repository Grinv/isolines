module.exports =
  dev:
    options:
      outputStyle: 'nested'
      sourceMap: true
    files: [{
      expand: true
      cwd: 'src/styles'
      src: ['*.sass']
      dest: 'dist/styles'
      ext: '.css'
    }]
  prod:
    options:
      outputStyle: 'compressed'
      sourceMap: false
    files: [{
      expand: true
      cwd: 'src/styles'
      src: ['*.sass']
      dest: 'dist/styles'
      ext: '.css'
    }]
