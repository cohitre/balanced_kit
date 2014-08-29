`import BaseResponse from "balanced/lib/base_response"`
`import BaseErrorsCollection from "balanced/lib/base_errors_collection"`

class BalancedApiErrorResponse extends BaseResponse
  getErrorsCollection: ->
    collection = new BaseErrorsCollection()
    for error in @response.errors
      if error.extras
        for property, message of error.extras
          collection.addError(property, message)
      else
        collection.addError(undefined, error.description)
    collection

`export default BalancedApiErrorResponse`
