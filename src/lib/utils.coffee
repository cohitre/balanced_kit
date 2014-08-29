Utils =
  reject: (value) ->
    RSVP.reject(value)
  resolve: (value) ->
    RSVP.resolve(value)
  encodeAuthorization: (apiKey) ->
    'Basic ' + window.btoa(apiKey + ':')

`export default Utils`
