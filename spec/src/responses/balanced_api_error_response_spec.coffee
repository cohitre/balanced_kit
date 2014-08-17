`import BalancedApiErrorResponse from "balanced/responses/balanced_api_error_response"`
ERROR_RESPONSE =
  responseJSON:
    "errors": [
      {
        "status": "Unauthorized",
        "category_code": "authentication-required",
        "description": "Some error message",
        "status_code": 401,
        "category_type": "permission",
        "request_id": "OHMxxxxxxxxxxxxxxxx"
      },
      {
        "status": "Unauthorized",
        "category_code": "authentication-required",
        "description": "Another error message",
        "status_code": 401,
        "category_type": "permission",
        "request_id": "OHMxxxxxxxxxxxxxxxx"
      }
    ]

describe "BalancedApiErrorResponse", ->
  describe "#getErrorMessages", ->
    it "should return a list of errors", ->
      subject = new BalancedApiErrorResponse(ERROR_RESPONSE)
      expect(subject.getErrorMessages()).toEqual([
        "Some error message",
        "Another error message"
      ])
