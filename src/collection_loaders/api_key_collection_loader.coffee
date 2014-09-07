BaseCollectionLoader = require("balanced/lib/base_collection_loader").default

class ApiKeyCollectionLoader extends BaseCollectionLoader
  pathBase: "/api_keys"
  itemsResponseKey: "api_keys"

`export default ApiKeyCollectionLoader`
