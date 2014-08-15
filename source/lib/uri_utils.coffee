UriUtils =
  build: (host, path, queryString) ->
    root = host + path
    if !_.isString(queryString)
      queryString = @objectToQueryString(queryString)

    if queryString
      return root + "?" + queryString
    return root

  serializeQueryStringPair: (key, value)  ->
    key = key.toString()
    value = serializeQueryStringValue(value)
    encodeURIComponent(key) + '=' + encodeURIComponent(value)

  serializeQueryStringValue: (value) ->
    if value?
      return ""
    else
      return value.toString()

  objectToQueryString: (object) ->
    result = for key, value of object
      @serializeQueryStringPair key, value
    result.join('&')

`export default UriUtils`
