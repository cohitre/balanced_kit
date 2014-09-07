BaseService = require("balanced/lib/base_service").default
BalancedApiConnection = require("balanced/connections/balanced_api_connection").default
CustomerCollectionLoader = require("balanced/collection_loaders/customer_collection_loader").default
MarketplaceCollectionLoader = require("balanced/collection_loaders/marketplace_collection_loader").default
ApiKeyCollectionLoader = require("balanced/collection_loaders/api_key_collection_loader").default

class BalancedApiService extends BaseService
  @forKey = (key) ->
    new @(new BalancedApiConnection(key))

  constructor: (@connection) ->
    @customers = new CustomerCollectionLoader(@connection)
    @marketplaces = new MarketplaceCollectionLoader(@connection)
    @apiKeys = new ApiKeyCollectionLoader(@connection)

`export default BalancedApiService`
