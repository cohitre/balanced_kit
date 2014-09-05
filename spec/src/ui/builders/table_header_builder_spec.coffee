TableHeaderBuilder = require('balanced/ui/builders/table_header_builder')['default']

describe "TableHeaderBuilder", ->
  describe ".build", ->
    it "creates a builder when no arguments are passed", ->
      builder = TableHeaderBuilder.build()
      expect(builder.viewTemplate).toBe "blank"

    it "creates a builder with a template and no attributes", ->
      builder = TableHeaderBuilder.build("text")
      expect(builder.viewTemplate).toBe "text"
      expect(builder.viewAttributes).toEqual {}

    it "creates a builder with a template and string", ->
      builder = TableHeaderBuilder.build("static", "Cool")
      expect(builder.viewTemplate).toBe "static"
      expect(builder.viewAttributes).toEqual(
        text: "Cool"
      )

    it "creates a builder with a template and attributes", ->
      builder = TableHeaderBuilder.build("static", adjective: "cool")
      expect(builder.viewTemplate).toBe "static"
      expect(builder.viewAttributes).toEqual(
        adjective: "cool"
      )

  describe "#template", ->
    it "is a setter", ->
      builder = new TableHeaderBuilder
      builder.template "template"
      expect(builder.viewTemplate).toBe "template"

  describe "#attributes", ->
    it "evaluates the callback on the spot", ->
      builder = new TableHeaderBuilder
      builder.attributes ->
        "attributes"
      expect(builder.viewAttributes).toBe "attributes"


  describe "#getViewTemplateLookupKey", ->
    it "returns a template name with the right format", ->
      builder = new TableHeaderBuilder
      builder.template "blank"
      expect(builder.getViewTemplateLookupKey()).toEqual "view:balanced_kit/table_cells/blank_header_cell"
