class BallSprite extends Sprite
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

class GreenBall extends BallSprite

class RedBall extends BallSprite
  sx: 64

class PurpleBall extends BallSprite
  sx: 128

class YellowBall extends BallSprite
  sy: 64

class BlueBall extends BallSprite
  sy: 64
  sx: 64

class BlackBall extends BallSprite
  sy: 64
  sx: 128

class WhiteBall extends BallSprite
  sy: 64
  sx: 192
