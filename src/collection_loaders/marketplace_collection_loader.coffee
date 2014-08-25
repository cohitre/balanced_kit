`import BaseCollectionLoader from "balanced/lib/base_collection_loader"`

class MarketplaceCollectionLoader extends BaseCollectionLoader
  pathBase: "/marketplaces"
  itemsResponseKey: "marketplaces"

  transformFilterAttributes: (attributes) ->
    @buildFilterQueryString()

`export default MarketplaceCollectionLoader`
