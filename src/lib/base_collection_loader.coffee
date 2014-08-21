class BaseCollectionLoader
  @define = (connection, path) ->
    new @(connection, path)

  constructor: (@connection, @path) ->

  start: ->
    @connection.get(@path)

`export default BaseCollectionLoader`
