jasmine.getConnection = (returnValue) ->
  connection =
    get: ->
    post: ->

  spyOn(connection, "post").and.stub().and.returnValue(RSVP.resolve(returnValue))
  spyOn(connection, "get").and.stub().and.returnValue(RSVP.resolve(returnValue))
  connection
