getRandomNumber = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

getRndPos = ->
  getRandomNumber(0, 8) * 64 + 20

class Game
  viewWidth: 616
  viewHeight: 616
  ballSprites: []
  gridTile: null

  constructor: ->
    @ctx = @createCanvas()

    @ballSprites.push(new GreenBall(this, getRndPos(), getRndPos()))
    @ballSprites.push(new RedBall(this, getRndPos(), getRndPos()))
    @ballSprites.push(new PurpleBall(this, getRndPos(), getRndPos()))

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
    sprite.draw() for sprite in @ballSprites
    @renderDebugOverlay(delta)

  renderDebugOverlay: (delta) ->
    @ctx.fillStyle = '#10161C'
    @ctx.fillRect(0, 0, 80, 20)

    text = "#{Math.round(1e3 / delta)} FPS"
    @ctx.fillStyle = 'white'
    @ctx.font = 'Bold 15px Helvetica'
    @ctx.fillText(text, 5, 15)

  renderGrid: ->
    columns = rows = 9
    for i in [0...columns * rows]
      @gridTile.draw((i % columns) * 64 + 20, (i / rows | 0) * 64 + 20)
