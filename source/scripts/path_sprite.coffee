class PathSprite extends Sprite
  sw: 64
  sh: 64
  dw: 64
  dh: 64
  sx: 128
  sy: 128

  constructor: (game) ->
    super(game)

  draw: (x, y) ->
    @dx = x
    @dy = y
    @drawImage(@sx, @sy, @dx, @dy)
