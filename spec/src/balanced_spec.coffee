BalancedKit = require("balanced/balanced").default

describe 'BalancedKit', ->
  it "should have the right modules", ->
    expect(BalancedKit.utils).toBeDefined()

  describe "#service", ->
    it "should return a BalancedApiService", ->
      expect(BalancedKit.service("some-secret").connection).toBeDefined()
