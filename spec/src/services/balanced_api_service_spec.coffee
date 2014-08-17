`import BalancedApiService from "balanced/services/balanced_api_service"`

ERROR_RESPONSE = "error response"

fakeConnection = (response, isSuccess=true) ->
  get: (path) ->
    deferred = $.Deferred ( defer ) ->
      if isSuccess
        defer.resolve response
      else
        defer.reject response
    deferred.promise()


describe "BalancedApiService", ->
  describe "::forKey", ->
    it "should instantiate a service with a connection", ->
      service = BalancedApiService.forKey("secretKey")
      expect(service.connection.apiKey).toBe "secretKey"

  describe "#getMarketplaces", ->
    it "should handle a failure", (done) ->
      connection = fakeConnection(ERROR_RESPONSE, false)
      service = new BalancedApiService(connection)
      service.getMarketplaces().fail (errorResponse) ->
        expect(errorResponse.response).toBe ERROR_RESPONSE
        done()
