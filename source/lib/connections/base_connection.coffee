`import UriUtils from "balanced/lib/uri_utils"`

class BaseConnection
  settings: (settings) ->
    return settings

  buildUrl: (path, queryString) ->
    return UriUtils.build(@host, path, queryString)

  del: (url) ->
    this.ajax(url,
      type: "DELETE"
    )

  get: (url, queryString) ->
    this.ajax(url,
      type: "GET"
    )

  post: (url, data) ->
    this.ajax(url,
      data: data,
      type: "POST"
    )

  put: (url, data) ->
    this.ajax(url,
      data: data,
      type: "POST"
    )

  ajax: (path, settings) ->
    url = @buildUrl(path)
    settings = @settings(settings)
    @constructor.ajax(url, settings)

BaseConnection.ajax = (url, settings) ->
  $.ajax(url, settings)

`export { BaseConnection }`
`export default BaseConnection`
