`import BaseResponse from "balanced/lib/base_response"`

get = (name) ->
  ->
    uri = @getMeta()[name]
    if uri
      @connection.get(uri)

has = (name) ->
  -> @getMeta()[name]

class BalancedApiResponse extends BaseResponse
  setConnection: (@connection) ->

  hasNext: has "next"
  next: get "next"

  hasPrev: has "previous"
  prev: get "previous"

  first: get "first"
  last: get "last"

  getMeta: ->
    @response.meta

  getLinks: ->
    @response.links

  getItems: ->
    result = {}
    for key, value of @response
      if ["meta", "links"].indexOf(key) == -1
        result[key] = value
    result

`export default BalancedApiResponse`
