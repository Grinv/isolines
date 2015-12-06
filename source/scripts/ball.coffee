class Ball extends Sprite
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

class GreenBall extends Ball

class RedBall extends Ball
  sx: 64

class PurpleBall extends Ball
  sx: 128

class YellowBall extends Ball
  sy: 64

class BlueBall extends Ball
  sy: 64
  sx: 64

class BlackBall extends Ball
  sy: 64
  sx: 128

class WhiteBall extends Ball
  sy: 64
  sx: 192
