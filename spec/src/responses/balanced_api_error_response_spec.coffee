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
        "status": "Bad Request",
        "category_code": "request",
        "additional": null,
        "status_code": 400,
        "category_type": "request",
        "extras": {
          "email": "\"Jimmy Error\" must be a valid email address as specified by RFC-2822"
        },
        "request_id": "OHMxxxxxxxxxxxxxxxx",
        "description": "Invalid field [email] - \"Jimmy Error\" must be a valid email address as specified by RFC-2822."
      }
    ]

describe "BalancedApiErrorResponse", ->
  describe "#getErrorsCollection", ->
    it "should return a populated errors collection", ->
      subject = BalancedApiErrorResponse.fromXhr(ERROR_RESPONSE)
      expect(subject.getErrorsCollection().getErrorMessages()).toEqual([
        "Some error message",
        '"Jimmy Error" must be a valid email address as specified by RFC-2822'
      ])
