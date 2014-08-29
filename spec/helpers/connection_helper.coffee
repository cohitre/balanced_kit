jasmine.getConnection = ->
  connection =
    get: ->
    post: ->

  spyOn(connection, "post").and.returnValue
    then: ->
  spyOn(connection, "get").and.returnValue
    then: ->
  connection
