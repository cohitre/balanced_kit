`import UriUtils from "balanced/lib/uri_utils"`

class BaseConnection
  @ajax = (url, settings) ->
    $.ajax(url, settings)

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

    success = (response) =>
      @handleSuccessResponse(response)
    error = (response) =>
      r = @handleErrorResponse(response)
      $.Deferred().reject(r).promise()

    @constructor.ajax(url, settings).then(success, error)

  handleSuccessResponse: (response) ->
    response
  handleErrorResponse: (response) ->
    response

`export { BaseConnection }`
`export default BaseConnection`
