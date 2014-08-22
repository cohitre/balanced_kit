`import QueryStringBuilder from "balanced/lib/query_string_builder"`

describe "QueryStringBuilder", ->
  describe "#addValue", ->
    test = (key, value) ->
      builder = new QueryStringBuilder
      builder.addValue(key, value)
      builder.getQueryStringAttributes()

    it "should serialize arrays", ->
      result = test("status", ["pending", "finished", "failed"])
      expect(result).toEqual("status[in]": "pending,finished,failed")

      result = test("status", ["pending"])
      expect(result).toEqual(status: "pending")

      result = test("status", [])
      expect(result).toEqual({})

    it "should ignore blank arguments", ->
      result = test("status", undefined)
      expect(result).toEqual({})
      result = test("status", null)
      expect(result).toEqual({})
      result = test("", null)
      expect(result).toEqual({})

    it "should serialize date", ->
      result = test("created_at[>]", new Date("2000-10-10T07:00:00.000Z"))
      expect(result).toEqual({
        "created_at[>]": "2000-10-10T07:00:00.000Z"
      })

    it "should serialize strings", ->
      result = test("query", "search")
      expect(result).toEqual(query: "search")
