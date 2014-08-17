`import BaseService from "balanced/lib/base_service"`

`import BalancedApiConnection from "balanced/connections/balanced_api_connection"`
`import CustomerCollectionLoader from "balanced/collection_loaders/customer_collection_loader"`

class BalancedApiService extends BaseService
  @forKey = (key) ->
    new @(new BalancedApiConnection(key))

  constructor: (@connection) ->

  customers: (path="/customers") ->
    CustomerCollectionLoader.define(@connection, path)

`export default BalancedApiService`
