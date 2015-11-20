class Animal
  constructor: (name) ->
    @name = name

  move: (meters) ->
    alert @name + " moved #{meters}m"

  getName: ->
    console.log @name
