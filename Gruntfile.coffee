module.exports = (grunt) ->
  require('time-grunt') grunt
  require('load-grunt-tasks') grunt

  grunt.initConfig
    clean: [
      'build/*'
      '!build/.gitkeep'
      '.tmp'
    ]

    coffeelint:
      options:
        configFile: 'coffeelint.json'
      app: [
        'source/scripts/*.coffee'
        'Gruntfile.coffee'
      ]

    coffee:
      development:
        options:
          preserve_dirs: true
        expand: true
        cwd: 'source/scripts'
        src: ['**/*.coffee']
        dest: 'build/scripts'
        ext: '.js'
        sourceMap: true
      production:
        expand: true
        cwd: 'source/scripts'
        src: ['**/*.coffee']
        dest: '.tmp/scripts'
        ext: '.js'

    uglify:
      options:
        screwIE8: true
      production:
        files: [{
          expand: true
          cwd: '.tmp/scripts'
          src: '**/*.js'
          dest: 'build/scripts'
          ext: '.min.js'
        }]

    imagemin:
      all:
        files: [{
          expand: true
          cwd: 'source/images'
          src: ['**/*.{png,jpg,gif}']
          dest: 'build/images'
        }]

    sass:
      development:
        options:
          sourceComments: true
          sourceMap: true
        files: [{
          expand: true
          cwd: 'source/styles'
          src: ['**/*.sass']
          dest: 'build/styles'
          ext: '.css'
        }]
      production:
        files: [{
          expand: true
          cwd: 'source/styles'
          src: ['**/*.sass']
          dest: 'build/styles'
          ext: '.css'
        }]

    postcss:
      development:
        options:
          map: true
          processors: [require('autoprefixer') browsers: 'last 2 versions']
        src: 'build/styles/**/*.css'
      production:
        options:
          processors: [
            require('autoprefixer') browsers: 'last 2 versions'
            require('cssnano')
          ]
        src: 'build/styles/**/*.css'

    watch:
      options:
        livereload: true
      scripts:
        files: ['source/scripts/**/*.coffee']
        tasks: [
          'coffeelint'
          'coffee:development'
        ]
      styles:
        files: ['source/styles/**/*.sass']
        tasks: [
          'sass:development'
          'postcss:development'
        ]
      images:
        files: ['source/images/**/*.{png,jpg,gif}']
        tasks: ['imagemin']

  grunt.registerTask 'default', [
    'clean',
    'coffeelint',
    'coffee:development',
    'imagemin',
    'sass:development',
    'postcss:development'
    'watch'
  ]

  grunt.registerTask 'build', [
    'clean',
    'coffeelint',
    'coffee:production',
    'uglify',
    'imagemin',
    'sass:production',
    'postcss:production'
  ]
