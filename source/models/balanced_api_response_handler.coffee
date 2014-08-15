`import Marketplace from "./marketplace"`

class BalancedApiResponseHandler
  constructor: (@connection, @response) ->

  getMarketplaces: ->
    marketplaces = @response.marketplaces || []
    for attributes in marketplaces
      new Marketplace(@connection, attributes, @response.links, @response.meta)

`export default BalancedApiResponseHandler`
