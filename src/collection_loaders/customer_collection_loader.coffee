`import UriUtils from "balanced/lib/uri_utils"`
`import BalancedApiResponse from "balanced/responses/balanced_api_response"`
`import BalancedErrorApiResponse from "balanced/responses/balanced_api_error_response"`
`import BaseCollectionLoader from "balanced/lib/base_collection_loader"`
`import CustomerValidator from "balanced/validators/customer_validator"`

isCustomerHref = (query) ->
  _.isString(query) && query.indexOf("/customers/") >= 0

class CustomerCollectionLoader extends BaseCollectionLoader
  pathBase: "/customers"
  itemsResponseKey: "customers"

  transformFilterAttributes: (attributes) ->
    @buildFilterQueryString(
      limit: attributes.limit
      sort: attributes.sort

      "created_at[>]": attributes.startTime
      "created_at[<]": attributes.endTime
    )

  validate: (attr) ->
    CustomerValidator.validate(attr)

`export default CustomerCollectionLoader`
