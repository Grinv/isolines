class Game
  viewWidth: 616
  viewHeight: 616
  gridOffset: 20
  tileSize: 64
  ballSprites: []
  fieldSize: 9
  field: []
  mouseSelections: []
  selectionSprites: []
  pathNodes: []

  constructor: ->
    @ctx = @createCanvas()

    @gridSprite = new GridSprite(this)

    @ballSprites.push(new GreenBall(this))
    @ballSprites.push(new RedBall(this))
    @ballSprites.push(new PurpleBall(this))
    @ballSprites.push(new YellowBall(this))
    @ballSprites.push(new BlueBall(this))
    @ballSprites.push(new BlackBall(this))
    @ballSprites.push(new WhiteBall(this))

    @selectionSprites.push(new YellowSelection(this))
    @selectionSprites.push(new BlueSelection(this))

    @pathSprite = new PathSprite(this)

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
      @field[row][column] = Math.max(-1, getRandomNumber(-12, 6))

  run: ->
    @update()

  update: =>
    currentTime = new Date().getTime()
    @render(currentTime - @lastUpdate)
    @lastUpdate = currentTime
    window.requestAnimationFrame(@update)

  render: (delta) ->
    @renderField()
    @renderMouseSelection()
    @renderDebugOverlay(delta)

  drawSprite: (sprite, m, n) ->
    x = m * @tileSize + @gridOffset
    y = n * @tileSize + @gridOffset
    sprite.draw(x, y)

  renderField: ->
    for i in [0...@fieldSize**2]
      column = i % @fieldSize
      row = i / @fieldSize | 0

      @drawSprite(@gridSprite, column, row)

      continue if @field[column][row] < 0

      @drawSprite(@ballSprites[@field[column][row]], column, row)

  renderDebugOverlay: (delta) ->
    @ctx.fillStyle = '#10161C'
    @ctx.fillRect(0, 0, 80, 20)

    text = "#{Math.round(1e3 / delta)} FPS"
    @ctx.fillStyle = 'white'
    @ctx.font = 'Bold 15px Helvetica'
    @ctx.fillText(text, 5, 15)

  renderMouseSelection: ->
    i = 0
    for selection in @mouseSelections
      @drawSprite(@selectionSprites[i], selection.x, selection.y)
      i++

  getSelection: (x, y) ->
    selection = {}

    return null unless x > @gridOffset and x < @viewWidth - @gridOffset
    return null unless y > @gridOffset and y < @viewHeight - @gridOffset

    selection.x = (x - @gridOffset) / @tileSize | 0
    selection.y = (y - @gridOffset) / @tileSize | 0
    selection

  isTileFree: (x, y) ->
    @field[x][y] < 0

  constructPath: ->
    pathHandler = new Path(@field)
    sx = @mouseSelections[0].x
    sy = @mouseSelections[0].y
    dx = @mouseSelections[1].x
    dy = @mouseSelections[1].y
    pathHandler.find(sx, sy, dx, dy)

  initInputHandler: ->
    $('canvas').on 'click', (event) =>
      offset = $('canvas').offset()
      x = event.clientX - offset.left
      y = event.clientY - offset.top
      currentSelection = @getSelection(x, y)

      if currentSelection?
        switch @mouseSelections.length
          when 0
            unless @isTileFree(currentSelection.x, currentSelection.y)
              @mouseSelections.push(currentSelection)
              @pathNodes = []
          when 1
            if @isTileFree(currentSelection.x, currentSelection.y)
              @mouseSelections.push(currentSelection)
              path = @constructPath()
              if path.length > 0
                [from, ..., to] = path
                @field[to.x][to.y] = @field[from.x][from.y]
                @field[from.x][from.y] = -1
                @mouseSelections.shift()
              else
                @mouseSelections.pop()
            else
              @mouseSelections = []
              @pathNodes = []
              @mouseSelections.push(currentSelection)
