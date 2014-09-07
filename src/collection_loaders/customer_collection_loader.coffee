BaseCollectionLoader = require("balanced/lib/base_collection_loader").default
CustomerValidator = require("balanced/validators/customer_validator").default

class CustomerCollectionLoader extends BaseCollectionLoader
  validatorClass: CustomerValidator
  pathBase: "/customers"
  itemsResponseKey: "customers"

  transformFilterAttributes: (attributes) ->
    @buildFilterQueryString(
      limit: attributes.limit
      sort: attributes.sort

      "created_at[>]": attributes.startTime
      "created_at[<]": attributes.endTime
    )

`export default CustomerCollectionLoader`
