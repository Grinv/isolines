class Ball extends Sprite
  sw: 64
  sh: 64
  dw: 64
  dh: 64

  draw: ->
    @drawImage(@sx, @sy, @dx, @dy)

class GreenBall extends Ball
  draw: ->
    @dx = getRandomNumber(-64, 70)
    @dy = getRandomNumber(-64, 240)
    super

class RedBall extends Ball
  sx: 64

  draw: ->
    @dx = getRandomNumber(70, 190)
    @dy = getRandomNumber(-64, 240)
    super

class PurpleBall extends Ball
  sx: 128

  draw: ->
    @dx = getRandomNumber(200, 320)
    @dy = getRandomNumber(-64, 240)
    super
