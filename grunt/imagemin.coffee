module.exports =
  all:
    files: [{
      expand: true
      cwd: 'source/images'
      src: ['**/*.{png,jpg,gif}']
      dest: 'build/images'
    }]
