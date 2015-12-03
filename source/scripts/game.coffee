getRandomNumber = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

class Game
  viewWidth: 576
  viewHeight: 576
  ballSprites: []
  gridTile: null

  constructor: ->
    @ctx = @createCanvas()

    @ballSprites.push(new GreenBall(this))
    @ballSprites.push(new RedBall(this))
    @ballSprites.push(new PurpleBall(this))
    @gridTile = new GridTile(this)

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
    @renderGrid()
    # sprite.draw() for sprite in @ballSprites
    @renderDebugOverlay(delta)

  renderDebugOverlay: (delta) ->
    @ctx.fillStyle = 'black'
    @ctx.fillRect(5, 5, 80, 20)

    text = "#{Math.round(1e3 / delta)} FPS"
    @ctx.fillStyle = 'white'
    @ctx.font = 'Bold 15px Helvetica'
    @ctx.fillText(text, 10, 20)

  renderGrid: ->
    i = 0
    while i < 9
      j = 0
      while j < 9
        @gridTile.draw(i * 64, j * 64)
        j++
      i++
