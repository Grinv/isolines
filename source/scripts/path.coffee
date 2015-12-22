class Path
  grid: []
  gridSize: 0

  constructor: (grid) ->
    @gridSize = grid.length

    @grid = for i in [0...@gridSize]
      for j in [0...@gridSize]
        if grid[i][j] is -1
          Infinity
        else
          'x'

  getNeighbors: (node) ->
    neighbors = []

    x = node.x
    y = node.y

    if x - 1 >= 0
      val = @grid[x - 1][y]
      unless val is 'x'
        neighbors.push({x: x - 1, y, val})
    if y - 1 >= 0
      val = @grid[x][y - 1]
      unless val is 'x'
        neighbors.push({x, y: y - 1, val})
    if x + 1 < @gridSize
      val = @grid[x + 1][y]
      unless val is 'x'
        neighbors.push({x: x + 1, y, val})
    if y + 1 < @gridSize
      val = @grid[x][y + 1]
      unless val is 'x'
        neighbors.push({x, y: y + 1, val})

    neighbors

  find: (sx, sy, dx, dy) ->
    path = []
    queue = []
    found = false

    @grid[sx][sy] = 0
    x = sx
    y = sy
    rootNode = {x, y}
    queue.push(rootNode)

    while queue.length > 0 and not found
      currentNode = queue.shift()
      currentDistance = @grid[currentNode.x][currentNode.y]

      neighbors = @getNeighbors(currentNode)
      for neighbor in neighbors
        continue unless neighbor.val is Infinity
        @grid[neighbor.x][neighbor.y] = currentDistance + 1
        queue.push(neighbor)
        if dx is neighbor.x and dy is neighbor.y
          found = true
          break

    if found
      currentDistance = @grid[dx][dy]
      currentNode = {x: dx, y: dy}
      path.unshift({x: dx, y: dy})
      while currentDistance > 0
        neighbors = @getNeighbors(currentNode)
        minimalNeighbor = neighbors.pop()
        minimalDistance = @grid[minimalNeighbor.x][minimalNeighbor.y]
        for neighbor in neighbors
          if neighbor.val < minimalNeighbor.val
            minimalNeighbor = neighbor
        path.unshift(minimalNeighbor)
        currentNode = minimalNeighbor
        currentDistance--
    path
