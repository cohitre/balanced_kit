isBlank = (value) ->
  _.isString(value) && value.replace(/^\s+/, "").replace(/\s+$/).length == 0

class QueryStringBuilder
  constructor: ->
    @queryStringAttributes = {}

  addValues: (object) ->
    for key, value of object
      @addValue(key, value)
    @

  addValue: (key, value) ->
    if _.isArray value
      if value.length == 1
        @queryStringAttributes[key] = value[0]
      else if value.length > 1
        @queryStringAttributes[key + "[in]"] = value.join(",")
    else if _.isDate value
      @queryStringAttributes[key] = value.toISOString()
    else if !isBlank(value) && !_.isNull(value) && !_.isUndefined(value)
      @queryStringAttributes[key] = value
    @

  getQueryStringAttributes: ->
    @queryStringAttributes

`export default QueryStringBuilder`
