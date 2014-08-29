`import UriUtils from "balanced/lib/uri_utils"`

class BaseConnection
  @ajax = (url, settings) ->

    new RSVP.Promise((resolve, reject)  ->
      $.ajax(url, settings).then(resolve, reject)
    )

  settings: (object) ->
    object

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
      type: "PUT"
    )

  ajax: (path, settings) ->
    url = UriUtils.build(@host, path)
    settings = @settings(settings)
    @constructor.ajax(url, settings)

`export default BaseConnection`
