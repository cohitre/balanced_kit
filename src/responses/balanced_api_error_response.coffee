`import BaseResponse from "balanced/lib/base_response"`

class BalancedApiErrorResponse extends BaseResponse
  getErrorMessages: ->
    for error in @response.responseJSON.errors
      error.description

`export default BalancedApiErrorResponse`
