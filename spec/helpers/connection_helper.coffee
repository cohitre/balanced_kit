jasmine.getConnection = ->
  object =
    get: ->
    post: ->

  spyOn(object, "get")
  spyOn(object, "post")
  object
