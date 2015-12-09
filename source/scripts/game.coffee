class Game
  viewWidth: 616
  viewHeight: 616
  gridOffset: 20
  ballSprites: []
  gridTile: null
  fieldSize: 9
  field: []
  currentMousePosition: {x: 0, y: 0}

  constructor: ->
    @ctx = @createCanvas()

    @ballSprites.push(new GreenBall(this))
    @ballSprites.push(new RedBall(this))
    @ballSprites.push(new PurpleBall(this))
    @ballSprites.push(new YellowBall(this))
    @ballSprites.push(new BlueBall(this))
    @ballSprites.push(new BlackBall(this))
    @ballSprites.push(new WhiteBall(this))

    @gridTile = new GridTile(this)
    @initBallsPosition()

    @initInputHandler()

  createCanvas: ->
    canvas = document.createElement('canvas')
    canvas.width = @viewWidth
    canvas.height = @viewHeight
    $('.container .game').append(canvas)
    canvas.getContext('2d')

  initBallsPosition: ->
    @field = new Array(@fieldSize)

    for i in [0...@fieldSize]
      @field[i] = new Array(@fieldSize)

    for i in [0...@fieldSize**2]
      column = i % @fieldSize
      row = i / @fieldSize | 0
      @field[row][column] = getRandomNumber(-1, 6)

  run: ->
    @update()

  update: =>
    currentTime = new Date().getTime()
    @render(currentTime - @lastUpdate)
    @lastUpdate = currentTime
    window.requestAnimationFrame(@update)

  render: (delta) ->
    @renderGrid()
    @renderBalls()
    @renderMouseSelection()
    @renderDebugOverlay(delta)

  renderDebugOverlay: (delta) ->
    @ctx.fillStyle = '#10161C'
    @ctx.fillRect(0, 0, 80, 20)

    text = "#{Math.round(1e3 / delta)} FPS"
    @ctx.fillStyle = 'white'
    @ctx.font = 'Bold 15px Helvetica'
    @ctx.fillText(text, 5, 15)

  renderGrid: ->
    for i in [0...@fieldSize**2]
      x = (i % @fieldSize) * 64 + @gridOffset
      y = (i / @fieldSize | 0) * 64 + @gridOffset
      @gridTile.draw(x, y)

  renderBalls: ->
    for i in [0...@fieldSize**2]
      column = i % @fieldSize
      row = i / @fieldSize | 0

      continue if @field[row][column] < 0

      x = row * 64 + @gridOffset
      y = column * 64 + @gridOffset
      @ballSprites[@field[row][column]].draw(x, y)

  renderMouseSelection: ->
    selection = @getSelection()
    if selection?
      @ctx.fillStyle = 'rgba(255, 127, 255, 0.7)'
      @ctx.fillRect(selection.x * 64 + 20, selection.y * 64 + 20, 64, 64)

  getSelection: ->
    x = @currentMousePosition.x
    y = @currentMousePosition.y

    selection = {}

    return null unless x > @gridOffset and x < @viewWidth - @gridOffset
    return null unless y > @gridOffset and y < @viewHeight - @gridOffset

    selection.x = (x - @gridOffset) / 64 | 0
    selection.y = (y - @gridOffset) / 64 | 0
    selection

  initInputHandler: ->
    $('canvas').on 'click', (event) =>
      offset = $('canvas').offset()
      x = event.clientX - offset.left
      y = event.clientY - offset.top
      @currentMousePosition.x = x
      @currentMousePosition.y = y
