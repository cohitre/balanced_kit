`import BalancedApiConnection from "balanced/connections/balanced_api_connection"`

describe "BalancedApiConnection", ->
  describe "#isAuthorized?", ->
    it "should be true when there's an api key", ->
      subject = new BalancedApiConnection("vjrbkjrbvr")
      expect(subject.isAuthorized()).toBe true

    it "should be false when there's no api key", ->
      subject = new BalancedApiConnection
      expect(subject.isAuthorized()).toBe false

  describe "#settings", ->
    it "should pass the encoded authorization", ->
      subject = new BalancedApiConnection("some-secret")
      expect(subject.settings().headers.Authorization).toEqual("Basic c29tZS1zZWNyZXQ6")

    it "should merge the additional settings", ->
      subject = new BalancedApiConnection()
      additional =
        contentType: null
      expect(subject.settings(additional)).toEqual(
        dataType: 'json'
        contentType: null
        headers: {}
        accepts:
          json: 'application/vnd.balancedpayments+json; version=1.1'
      )

    it "should encode the data", ->
      subject = new BalancedApiConnection()
      additional =
        data:
          name: "Jimmy Test",
          age: 10
        type: "POST"

      expect(subject.settings(additional).data).toEqual('{"name":"Jimmy Test","age":10}')
