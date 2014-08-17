`import UriUtils from "balanced/lib/uri_utils"`

class BaseConnection
  settings: (settings) ->
    return settings

  del: (path) ->
    this.ajax(path,
      type: "DELETE"
    )

  get: (path) ->
    this.ajax(path,
      type: "GET"
    )

  post: (path, data) ->
    this.ajax(path,
      data: data,
      type: "POST"
    )

  put: (path, data) ->
    this.ajax(path,
      data: data,
      type: "POST"
    )

  ajax: (path, settings) ->
    url = UriUtils.build(@host, path)
    settings = @settings(settings)
    @constructor.ajax(url, settings)
      .then (response) =>
        @handleSuccessResponse(response)
      .fail (response) =>
        r = @handleErrorResponse(response)
        $.Deferred().reject(r).promise()

  handleSuccessResponse: (response) ->
    response
  handleErrorResponse: (response) ->
    response

BaseConnection.ajax = (url, settings) ->
  $.ajax(url, settings)

`export { BaseConnection }`
`export default BaseConnection`
