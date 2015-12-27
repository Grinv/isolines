class SelectionSprite extends Sprite
  sw: 64
  sh: 64
  dw: 64
  dh: 64

  constructor: (game) ->
    super(game)

  draw: (x, y) ->
    @dx = x
    @dy = y
    @drawImage(@sx, @sy, @dx, @dy)

class YellowSelection extends SelectionSprite
  sy: 128

class BlueSelection extends SelectionSprite
  sx: 64
  sy: 128
