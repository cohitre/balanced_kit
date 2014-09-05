`import BaseService from "balanced/lib/base_service"`
`import BalancedApiConnection from "balanced/connections/balanced_api_connection"`
`import CustomerCollectionLoader from "balanced/collection_loaders/customer_collection_loader"`
`import MarketplaceCollectionLoader from "balanced/collection_loaders/marketplace_collection_loader"`
`import ApiKeyCollectionLoader from "balanced/collection_loaders/api_key_collection_loader"`

class BalancedApiService extends BaseService
  @forKey = (key) ->
    new @(new BalancedApiConnection(key))

  constructor: (@connection) ->
    @customers = new CustomerCollectionLoader(@connection)
    @marketplaces = new MarketplaceCollectionLoader(@connection)
    @apiKeys = new ApiKeyCollectionLoader(@connection)

`export default BalancedApiService`
