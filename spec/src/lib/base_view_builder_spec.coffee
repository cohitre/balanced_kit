BaseViewBuilder = require('balanced/lib/base_view_builder')['default']

describe "BaseViewBuilder", ->
  describe ".isDefinition", ->
    it "is true for empty arguments", ->
      result = BaseViewBuilder.isDefinition([])
      expect(result).toBe true

    it "is false if the lengths don't match", ->
      result = BaseViewBuilder.isDefinition([1, 2], "number", "number", "number")
      expect(result).toBe(false)
    it "is true if the types match one to one", ->
      result = BaseViewBuilder.isDefinition([1, null, "str", undefined], "number", "blank", "string", "blank")
      expect(result).toBe(true)

  describe ".isType", ->
    trueTest = (type, value) ->
      expect(BaseViewBuilder.isType(type, value)).toBe true
    falseTest = (type, value) ->
      expect(BaseViewBuilder.isType(type, value)).toBe false

    describe "string", ->
      it "is true for strings", ->
        falseTest("string", 1)
        trueTest("string", "")
        trueTest("string", "value")

    describe "function", ->
      it "is true for functions", ->
        trueTest "function", (->)
        falseTest "function", 10

    describe "object", ->
      it "is true for objects", ->
        trueTest "object", {}
        falseTest "object", null
        falseTest "object", undefined
        falseTest "object", "str"

    describe "array", ->
      it "is true for arrays", ->
        trueTest "array", []
        falseTest "array", 10

    describe "blank", ->
      it "is true for undefined and null", ->
        trueTest "blank", undefined
        trueTest "blank", null
        falseTest "blank", ""
        falseTest "blank", []

    describe "number", ->
      it "is true for numbers", ->
        trueTest "number", 10
        trueTest "number", 12.1
        falseTest "number", "120"

    describe "date", ->
      it "is true for dates", ->
        trueTest "date", new Date()
        falseTest "date", "str"

  describe "#getViewAttributes", ->
    it "returns the viewAttributes", ->
      builder = new BaseViewBuilder()
      builder.viewAttributes = "attributes"
      result = builder.getViewAttributes()
      expect(result).toBe "attributes"

  describe "#getViewTemplateLookupKey", ->
    it "returns a template lookup key", ->
      builder = new BaseViewBuilder()
      builder.viewTemplate = "template_name"
      result = builder.getViewTemplateLookupKey()
      expect(result).toBe "view:balanced_kit/template_name"

  describe "#toEmber", ->
    it "executes a lookup passing the correct attributes", ->
      spyOn(BalancedKit, "lookup")
      builder = new BaseViewBuilder()
      builder.viewTemplate = "template_name"
      builder.viewAttributes = "attributes"
      builder.toEmber()

      expect(BalancedKit.lookup).toHaveBeenCalledWith("view:balanced_kit/template_name", "attributes")

