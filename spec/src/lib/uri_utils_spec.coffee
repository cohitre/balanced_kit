`import UriUtils from "balanced/lib/uri_utils"`

describe "UriUtils", ->
  describe "#build", ->
    it "should include the query string when present", ->
      uri = UriUtils.build("http://example.org", "/value", "createdAt=yesterday")
      expect(uri).toEqual("http://example.org/value?createdAt=yesterday")

      uri = UriUtils.build("http://example.org", "/value", {
        createdAt: "yesterday"
      })
      expect(uri).toEqual("http://example.org/value?createdAt=yesterday")

    it "should not pass the query string if not present", ->
      uri = UriUtils.build("http://example.org", "/value")
      expect(uri).toEqual("http://example.org/value")

      uri = UriUtils.build("http://example.org", "/value", {})
      expect(uri).toEqual("http://example.org/value")

      uri = UriUtils.build("http://example.org", "/value", "")
      expect(uri).toEqual("http://example.org/value")

  describe "#buildPath", ->
    it "should merge the query string and path", ->
      result = UriUtils.buildPath("/path/query", {
        one: 1
        two: 2
        three: 3
      })
      expect(result).toEqual("/path/query?one=1&two=2&three=3")

  describe "#serializeQueryStringPair", ->
    it "should encode the values and pairs", ->
      expect(UriUtils.serializeQueryStringPair("percentage[=]", "100%")).toEqual("percentage%5B%3D%5D=100%25")
      expect(UriUtils.serializeQueryStringPair("percentage[=]", undefined)).toEqual("percentage%5B%3D%5D=")

  describe "#serializeQueryStringValue", ->
    it "should be empty for undefined or null values", ->
      expect(UriUtils.serializeQueryStringValue()).toEqual("")
      expect(UriUtils.serializeQueryStringValue(undefined)).toEqual("")
      expect(UriUtils.serializeQueryStringValue(null)).toEqual("")

    it "should call toString on the value", ->
      expect(UriUtils.serializeQueryStringValue(10)).toEqual("10")
      expect(UriUtils.serializeQueryStringValue("value")).toEqual("value")

  describe "#objectToQueryString", ->
    it "should serialize the key value pairs", ->
      object =
        "created_at[=]": 100
        resource: undefined
        filter: "valid"
      expect(UriUtils.objectToQueryString(object)).toEqual("created_at%5B%3D%5D=100&resource=&filter=valid")
      expect(UriUtils.objectToQueryString(undefined)).toEqual("")
