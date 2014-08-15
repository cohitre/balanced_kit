Utils =
  encodeAuthorization: (apiKey) ->
    'Basic ' + window.btoa(apiKey + ':')

`export default Utils`
