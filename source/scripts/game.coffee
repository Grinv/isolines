getRandomNumber = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

class Game
  viewWidth: 320
  viewHeight: 240
  sprites: []

  constructor: ->
    @ctx = @createCanvas()

    greenBall = new Sprite(this)
    greenBall.sw = 64
    greenBall.sh = 64
    greenBall.dw = 64
    greenBall.dh = 64

    redBall = new Sprite(this)
    redBall.sx = 64
    redBall.sw = 64
    redBall.sh = 64
    redBall.dw = 64
    redBall.dh = 64

    purpleBall = new Sprite(this)
    purpleBall.sx = 128
    purpleBall.sw = 64
    purpleBall.sh = 64
    purpleBall.dw = 64
    purpleBall.dh = 64

    @sprites.push(greenBall)
    @sprites.push(redBall)
    @sprites.push(purpleBall)

  createCanvas: ->
    canvas = document.createElement('canvas')
    canvas.width = @viewWidth
    canvas.height = @viewHeight
    $('.container .game').append(canvas)
    canvas.getContext('2d')

  run: ->
    @update()

  update: =>
    currentTime = new Date().getTime()
    @render(currentTime - @lastUpdate)
    @lastUpdate = currentTime
    window.requestAnimationFrame(@update)

  render: (delta) ->
    sprite.draw() for sprite in @sprites
    # @renderBackground()
    # @drawRandomBox()
    @renderDebugOverlay(delta)

  renderDebugOverlay: (delta) ->
    @ctx.fillStyle = 'black'
    @ctx.fillRect(5, 5, 80, 20)

    text = "#{Math.round(1e3 / delta)} FPS"
    @ctx.fillStyle = 'white'
    @ctx.font = 'Bold 15px Helvetica'
    @ctx.fillText(text, 10, 20)

  renderBackground: ->
    @ctx.fillStyle = 'black'
    @ctx.fillRect(0, 0, @viewWidth, @viewHeight)

  drawRandomBox: ->
    red = getRandomNumber(0, 255)
    green = getRandomNumber(0, 255)
    blue = getRandomNumber(0, 255)
    @ctx.fillStyle = "rgb(#{red}, #{green}, #{blue})"
    x = getRandomNumber(0, @viewWidth)
    y = getRandomNumber(0, @viewHeight)
    @ctx.fillRect(x, y, 30, 30)

class SpriteImage
  loaded: false
  src: "images/sprite_sheet.png"

  constructor: ->
    image = new Image
    image.src = @src
    image.onload = => @loaded = true
    @image = image

class Sprite
  sx: 0
  sy: 0
  sw: 0
  sh: 0
  dx: 0
  dy: 0
  dw: 0
  dh: 0
  image: new SpriteImage

  constructor: (@game) ->

  drawImage: (sx, sy, dx, dy) ->
    if @image.loaded
      @game.ctx.drawImage(@image.image, sx, sy, @sw, @sh, dx, dy, @dw, @dh)

  draw: ->
    @dx = getRandomNumber(-64, 320)
    @dy = getRandomNumber(-64, 240)
    @drawImage(@sx, @sy, @dx, @dy)
