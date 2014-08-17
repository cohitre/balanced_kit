`import Utils from "balanced/lib/utils"`

describe "Utils", ->
  describe "#encodeAuthorization", ->
    it "should encode the authorization", ->
      expect(Utils.encodeAuthorization("some-key-xxxxxxxxxxxxxxxxxxxxxxxxxxxx")).toEqual('Basic c29tZS1rZXkteHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eDo=')
