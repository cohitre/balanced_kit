Utils =
  reject: (value) ->
    BalancedKit.lib.RSVP.reject(value)
  resolve: (value) ->
    BalancedKit.lib.RSVP.resolve(value)
  encodeAuthorization: (apiKey) ->
    'Basic ' + window.btoa(apiKey + ':')

`export default Utils`
