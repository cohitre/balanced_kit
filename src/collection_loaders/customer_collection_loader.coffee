`import BalancedApiResponse from "balanced/responses/balanced_api_response"`
`import BalancedErrorApiResponse from "balanced/responses/balanced_api_error_response"`
`import BaseCollectionLoader from "balanced/lib/base_collection_loader"`

class CustomerCollectionLoader extends BaseCollectionLoader
  validate: (attr) ->
    CustomerForm.validate(attr)

  create: (attributes) ->
    @connection.post(@path, attributes)

  start: ->
    success = (response) =>
      new BalancedApiResponse(response)
    error = (xhr) =>
      BalancedErrorApiResponse.fromXhr(xhr)

    super().then(success, error)

`export default CustomerCollectionLoader`
