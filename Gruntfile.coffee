module.exports = (grunt) ->
  require('time-grunt') grunt
  require('load-grunt-tasks') grunt

  grunt.initConfig
    clean: [
      'build'
      '.tmp'
    ]

    coffeelint:
      options:
        configFile: 'coffeelint.json'
      app: [
        'source/scripts/**/*.coffee'
        'Gruntfile.coffee'
      ]

    sasslint:
      options:
        configFile: '.sass-lint.yml'
      app: [
        'source/styles/**/*.sass'
      ]

    coffeescript_concat:
      app:
        files:
          '.tmp/scripts/concatenated.coffee': ['source/scripts/**/*.coffee']

    coffee:
      development:
        options:
          join: true
        files:
          'build/scripts/application.js': ['.tmp/scripts/concatenated.coffee']
      production:
        options:
          join: true
        files:
          '.tmp/scripts/application.js': ['.tmp/scripts/concatenated.coffee']

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
      vendor:
        files: [{
          expand: true
          cwd: '.tmp/vendor/scripts'
          src: '**/*.js'
          dest: 'build/vendor/scripts'
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

    postcss:
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

    watch:
      scripts:
        files: ['source/scripts/**/*.coffee']
        tasks: [
          'coffeelint'
          'coffee:development'
        ]
      styles:
        files: ['source/styles/**/*.sass']
        tasks: [
          'sasslint'
          'sass:development'
          'postcss:development'
        ]
      images:
        files: ['source/images/**/*.{png,jpg,gif}']
        tasks: ['imagemin']
      added:
        files: [
          'source/styles/**/*.sass'
          'source/scripts/**/*.coffee'
        ]
        tasks: ['includeSource']
        options:
          event: ['added']
      app:
        files: ['source/index.html']
        tasks: ['includeSource']

    browserSync:
      app:
        bsFiles:
          src: 'build/**/*'
        options:
          watchTask: true
          server: './build'

    bower:
      development:
        dest: 'build/vendor'
        js_dest: 'build/vendor/scripts'
        css_dest: 'build/vendor/styles'
        fonts_dest: 'build/vendor/fonts'
        images_dest: 'build/vendor/images/'
      production:
        dest: 'build/vendor'
        js_dest: '.tmp/vendor/scripts'
        css_dest: 'build/vendor/styles'
        fonts_dest: 'build/vendor/fonts'
        images_dest: 'build/vendor/images/'

    'http-server':
      production:
        root: 'build'
        openBrowser: true

    realFavicon:
      favicons:
        src: 'source/favicon.svg'
        dest: 'build'
        options:
          iconsPath: './'
          html: ['build/index.html']
          design:
            ios:
              pictureAspect: 'backgroundAndMargin'
              backgroundColor: '#ffffff'
              margin: '14%'
            desktopBrowser: {}
            windows:
              pictureAspect: 'noChange'
              backgroundColor: '#da532c'
              onConflict: 'override'
            androidChrome:
              pictureAspect: 'noChange'
              themeColor: '#ffffff'
              manifest:
                name: 'isoLines'
                display: 'browser'
                orientation: 'notSet'
                onConflict: 'override'
            safariPinnedTab:
              pictureAspect: 'blackAndWhite'
              threshold: 46.5625
              themeColor: '#5bbad5'
          settings:
            scalingAlgorithm: 'Mitchell'
            errorOnImageTooSmall: false

    includeSource:
      options:
        basePath: 'build'
      app:
        files:
          'build/index.html': 'source/index.html'

    'gh-pages':
      options:
        base: 'build'
        message: 'Deploy auto-generated commit'
      src: ['**']


  grunt.registerTask 'default', [
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

  grunt.registerTask 'build', [
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

  grunt.registerTask 'serve', [
    'http-server'
  ]

  grunt.registerTask 'deploy', ['gh-pages']

  grunt.registerTask 'lint', [
    'coffeelint'
    'sasslint'
  ]
