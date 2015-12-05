getRandomNumber = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

getRndPos = (size, offset) ->
  getRandomNumber(0, 8) * size + offset
