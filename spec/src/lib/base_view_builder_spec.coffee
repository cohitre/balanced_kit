BaseViewBuilder = require('balanced/lib/base_view_builder')['default']

describe "BaseViewBuilder", ->
  subject = ->
    new BaseViewBuilder

  describe "#constructor", ->
    it "should initialize the internal properties", ->
      builder = subject()
      expect(builder.properties).toEqual {}
      expect(builder.attributes).toEqual {}
      expect(builder.templateName).toBeNull()

  describe "#template", ->
    it "has a setter", ->
      builder = subject()
      builder.template "text_block"
      expect(builder.templateName).toBe "text_block"

    it "has a getter", ->
      builder = subject()
      builder.templateName = "text_block"
      expect(builder.template()).toBe "text_block"

  describe "#text", ->
    it "extends the properties", ->
      builder = subject()
      builder.text "Important message"
      expect(builder.properties).toEqual
        text: "Important message"

  describe "#prop", ->
    it "gets the object when it receives no attributes", ->
      builder = subject()
      builder.properties =
        name: "Dr. Mario"
      expect(builder.prop()).toEqual
        name: "Dr. Mario"

    it "gets the field when it receives a string", ->
      builder = subject()
      builder.properties =
        name: "Dr. Mario"
      expect(builder.prop("name")).toEqual "Dr. Mario"

    it "merges the object when it receives an object", ->
      builder = subject()
      builder.properties =
        name: "Dr. Mario"
      builder.prop(coolness: "a lot")
      expect(builder.properties).toEqual
        name: "Dr. Mario",
        coolness: "a lot"

    it "adds a single object when it receives two arguments", ->
      builder = subject()
      builder.properties =
        name: "Dr. Mario"
      builder.prop("coolness", 100)
      expect(builder.properties).toEqual
        name: "Dr. Mario",
        coolness: 100

  describe "#attr", ->
    it "gets the object when it receives no attributes", ->
      builder = subject()
      builder.attributes =
        name: "Dr. Mario"
      expect(builder.attr()).toEqual
        name: "Dr. Mario"

    it "gets the field when it receives a string", ->
      builder = subject()
      builder.attributes =
        name: "Dr. Mario"
      expect(builder.attr("name")).toEqual "Dr. Mario"

    it "merges the object when it receives an object", ->
      builder = subject()
      builder.attributes =
        name: "Dr. Mario"
      builder.attr(coolness: "a lot")
      expect(builder.attributes).toEqual
        name: "Dr. Mario",
        coolness: "a lot"

    it "adds a single object when it receives two arguments", ->
      builder = subject()
      builder.attributes =
        name: "Dr. Mario"
      builder.attr("coolness", 100)
      expect(builder.attributes).toEqual
        name: "Dr. Mario",
        coolness: 100

  describe "#getViewTemplateLookupKey", ->
    it "returns a template lookup key", ->
      builder = subject()
      builder.templateName = "template_name"
      result = builder.getViewTemplateLookupKey()
      expect(result).toBe "view:balanced_kit/template_name"

  describe "#toEmber", ->
    it "executes a lookup passing the correct attributes", ->
      spyOn(BalancedKit, "lookup")

      builder = subject()
      builder.templateName = "template_name"
      builder.properties =
        text: "Mr. Potato Head"
      builder.attributes =
        disabled: "disabled"
      builder.toEmber()

      BalancedKit.lookup
      # .toEqual(["view:balanced_kit/template_name",
      #   text: "Mr. Potato head"
      #   disabled: "disabled"
      # ])

