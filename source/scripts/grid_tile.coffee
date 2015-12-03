class GridTile extends Sprite
  sx: 192
  sw: 64
  sh: 64
  dw: 64
  dh: 64

  draw: (dx, dy) ->
    @drawImage(@sx, @sy, dx, dy)
