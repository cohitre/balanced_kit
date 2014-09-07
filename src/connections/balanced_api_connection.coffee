BalancedApiResponse = require("balanced/responses/balanced_api_response").default
BalancedApiErrorResponse = require("balanced/responses/balanced_api_error_response").default
BaseConnection = require("balanced/lib/base_connection").default

BALANCED_API_HOST = "https://api.balancedpayments.com"
DEFAULT_SETTINGS =
  dataType: 'json'
  contentType: 'application/json; charset=UTF-8'
  accepts:
    json: 'application/vnd.balancedpayments+json; version=1.1'

class BalancedApiConnection extends BaseConnection
  constructor: (@apiKey) ->

  host: BALANCED_API_HOST

  getEncodedAuthorization: ->
    'Basic ' + window.btoa(@apiKey + ':')

  isAuthorized: ->
    @apiKey?

  settings: (additionalSettings) ->
    settings =

    headers = {}
    if (this.isAuthorized())
      headers.Authorization = this.getEncodedAuthorization()

    settings = _.extend(
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
    (new BalancedApiErrorResponse(response)).getErrorsCollection()

`export default BalancedApiConnection`
