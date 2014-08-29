class BaseResponse
  @fromXhr: (xhr) ->
    new @(xhr.responseJSON)
  constructor: (@response) ->

`export default BaseResponse;`
