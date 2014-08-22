`import UriUtils from "balanced/lib/uri_utils"`
`import BalancedApiResponse from "balanced/responses/balanced_api_response"`
`import BalancedErrorApiResponse from "balanced/responses/balanced_api_error_response"`
`import BaseCollectionLoader from "balanced/lib/base_collection_loader"`

class MarketplaceCollectionLoader extends BaseCollectionLoader
  pathBase: "/marketplaces"
  itemsResponseKey: "marketplaces"

  transformFilterAttributes: (attributes) ->
    @buildFilterQueryString()

  validate: (attr) ->
    CustomerValidator.validate(attr)

`export default MarketplaceCollectionLoader`
