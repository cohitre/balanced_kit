`import BaseCollectionLoader from "balanced/lib/base_collection_loader"`
`import CustomerValidator from "balanced/validators/customer_validator"`

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
