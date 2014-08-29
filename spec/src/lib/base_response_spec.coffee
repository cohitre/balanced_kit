`import BaseResponse from 'balanced/lib/base_response'`

describe 'BaseResponse', ->
  describe '.fromXhr', ->
    it "should create a response with the responsJSON value", ->
      response = BaseResponse.fromXhr(
        responseJSON: "This is the json"
      )
      expect(response.response).toEqual("This is the json")
