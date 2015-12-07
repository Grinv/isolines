module.exports =
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
