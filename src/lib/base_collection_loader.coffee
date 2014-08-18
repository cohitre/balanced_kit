class BaseCollectionLoader
  @define = (connection, path) ->
    class Klass extends @
      get: (url) ->
        connection.get(url)
      post: (url, data) ->
        connection.post(url, data)
    new Klass(path)

  constructor: (@path) ->

  start: ->
    @get(@path)

`export default BaseCollectionLoader`
