`import BalancedApiResponse from "balanced/responses/balanced_api_response"`
`import BalancedApiErrorResponse from "balanced/responses/balanced_api_error_response"`

`import BaseConnection from "balanced/lib/base_connection"`
`import Utils from "balanced/lib/utils"`

BALANCED_API_HOST = "https://api.balancedpayments.com"
DEFAULT_SETTINGS =
  dataType: 'json'
  contentType: 'application/json; charset=UTF-8'
  accepts:
    json: 'application/vnd.balancedpayments+json; version=1.1'

merge = (dest, objs...) ->
  for obj in objs
    dest[k] = v for k, v of obj
  dest

class BalancedApiConnection extends BaseConnection
  constructor: (@apiKey) ->

  host: BALANCED_API_HOST

  getEncodedAuthorization: ->
    Utils.encodeAuthorization(@apiKey)

  isAuthorized: ->
    @apiKey?

  settings: (additionalSettings) ->
    settings =

    headers = {}
    if (this.isAuthorized())
      headers.Authorization = this.getEncodedAuthorization()

    settings = merge(
      headers: headers
    , DEFAULT_SETTINGS, additionalSettings)

    if (settings.data && settings.type.toUpperCase() != "GET")
      settings.data = JSON.stringify(settings.data)
    settings

  handleSuccessResponse: (response) ->
    response = new BalancedApiResponse(response)
    response.setConnection(@)
    response

  handleErrorResponse: (response) ->
    new BalancedApiErrorResponse(response)

`export default BalancedApiConnection`
