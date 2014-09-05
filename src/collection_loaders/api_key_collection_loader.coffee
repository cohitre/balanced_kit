`import BaseCollectionLoader from "balanced/lib/base_collection_loader"`

class ApiKeyCollectionLoader extends BaseCollectionLoader
  pathBase: "/api_keys"
  itemsResponseKey: "api_keys"

`export default ApiKeyCollectionLoader`
