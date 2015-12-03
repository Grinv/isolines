class Ball extends Sprite
  sw: 64
  sh: 64
  dw: 64
  dh: 64

  constructor: (game, x, y) ->
    @dx = x
    @dy = y
    super(game)

  draw: ->
    @drawImage(@sx, @sy, @dx, @dy)

class GreenBall extends Ball

class RedBall extends Ball
  sx: 64

class PurpleBall extends Ball
  sx: 128
