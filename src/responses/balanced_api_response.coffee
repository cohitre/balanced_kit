BaseResponse = require("balanced/lib/base_response").default

get = (name) ->
  ->
    uri = @getMeta()[name]
    if uri
      @connection.get(uri).then (r) =>
        r = new BalancedApiResponse(r)
        r.setConnection(@connection)
        r

has = (name) ->
  -> @hasMeta(name)

class BalancedApiResponse extends BaseResponse
  setConnection: (connection) ->
    @connection = connection
    @

  hasMeta: (name) ->
    if arguments.length == 0
      !!@getMeta()
    else
      !!@getMeta(name)

  getMeta: (name) ->
    if arguments.length == 0
      return @response.meta
    else
      return @response.meta?[name]

  hasNext: has "next"
  hasPrev: has "previous"

  next: get "next"
  prev: get "previous"

  first: get "first"
  last: get "last"

  getLinks: ->
    @response.links

  getItems: ->
    result = {}
    for key, value of @response
      if ["meta", "links"].indexOf(key) == -1
        result[key] = value
    result

`export default BalancedApiResponse`
