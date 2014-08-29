`import Utils from "balanced/lib/utils"`

describe "Utils", ->
  describe "#reject", ->
    it "should return a rejected promise", ->

  describe "#resolve", ->
    it "should return a resolved promise", ->

  describe "#encodeAuthorization", ->
    it "should encode the authorization", ->
      expect(Utils.encodeAuthorization("some-key-xxxxxxxxxxxxxxxxxxxxxxxxxxxx")).toEqual('Basic c29tZS1rZXkteHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eDo=')
