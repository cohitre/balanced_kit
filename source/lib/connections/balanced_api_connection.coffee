`import BaseConnection from "./base_connection"`
`import Utils from "balanced/lib/utils"`

DEFAULT_SETTINGS =
  dataType: 'json'
  contentType: 'application/json; charset=UTF-8'
  accepts:
    json: 'application/vnd.balancedpayments+json; version=1.1'

BALANCED_API_HOST = "https://api.balancedpayments.com"

class BalancedApiConnection extends BaseConnection
  constructor: (@apiKey) ->

  host: BALANCED_API_HOST
  getEncodedAuthorization: ->
    Utils.encodeAuthorization(@apiKey)

  isAuthorized: ->
    @apiKey?

  settings: (additionalSettings) ->
    headers = {}
    if (this.isAuthorized())
      headers["Authorization"] = this.getEncodedAuthorization()

    settings = _.extend(
      headers: headers
    , DEFAULT_SETTINGS, additionalSettings)

    if (settings.data && settings.type.toUpperCase() != "GET")
      settings.data = JSON.stringify(settings.data)
    settings

`export { BalancedApiConnection }`
`export default BalancedApiConnection`
