isString = (obj) ->
  (typeof obj == 'string') || (obj instanceof String)

UriUtils =
  build: (host, path, qs) ->
    host + @buildPath(path, qs)

  buildPath: (path, queryString) ->
    if !isString(queryString)
      queryString = @objectToQueryString(queryString)

    if queryString
      return path + "?" + queryString
    return path

  serializeQueryStringPair: (key, value)  ->
    key = key.toString()
    value = @serializeQueryStringValue(value)
    encodeURIComponent(key) + '=' + encodeURIComponent(value)

  serializeQueryStringValue: (value) ->
    if value?
      return value.toString()
    else
      return ""

  objectToQueryString: (object) ->
    result = for key, value of object
      @serializeQueryStringPair key, value
    result.join('&')

`export default UriUtils`
