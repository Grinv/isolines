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
