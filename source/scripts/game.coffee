getRandomNumber = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

class Game
  viewWidth: 320
  viewHeight: 240
  sprites: []

  constructor: ->
    @ctx = @createCanvas()

    greenBall = new GreenBall(this)
    redBall = new RedBall(this)
    purpleBall = new PurpleBall(this)

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
