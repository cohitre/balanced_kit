BalancedApiService = require("balanced/services/balanced_api_service").default

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
