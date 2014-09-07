BaseResponse = require("balanced/lib/base_response").default
BaseErrorsCollection = require("balanced/lib/base_errors_collection").default

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
