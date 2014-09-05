TableCellBuilder = require('balanced/ui/builders/table_cell_builder')['default']

describe "TableCellBuilder", ->
  describe ".build", ->
    it "creates a builder when no arguments are passed", ->
      builder = TableCellBuilder.build()
      expect(builder.viewTemplate).toBe "blank"

    it "creates a builder with a template", ->
      builder = TableCellBuilder.build("static")
      expect(builder.viewTemplate).toBe "static"
      expect(builder.getViewAttributes()).toBe undefined

    it "creates a builder with a template and attributes", ->
      builder = TableCellBuilder.build("static", "someText")
      expect(builder.viewTemplate).toBe "static"
      expect(builder.getViewAttributes()).toEqual(
        text: "someText"
      )

    it "creates a builder with a template and attributes method", ->
      builder = TableCellBuilder.build("static", ->
        name: "mr. test"
      )
      expect(builder.viewTemplate).toBe "static"
      expect(builder.getViewAttributes()).toEqual(
        name: "mr. test"
      )

  describe "#template", ->
    it "is a setter", ->
      builder = new TableCellBuilder
      expect(builder.viewTemplate).toEqual "blank"
      builder.template "static"
      expect(builder.viewTemplate).toEqual "static"

  describe "#attributes", ->
    it "is a setter", ->
      builder = new TableCellBuilder
      method = ->
      builder.attributes(method)
      expect(builder.viewAttributes).toBe method

  describe "#getViewTemplateLookupKey", ->
    it "looks up the proper template", ->
      builder = new TableCellBuilder
      builder.template "jail"
      expect(builder.getViewTemplateLookupKey()).toEqual "view:balanced_kit/table_cells/jail_cell"

  describe "#getViewAttributes", ->
    it "gets the attributes for the given object", ->
      builder = new TableCellBuilder
      builder.viewAttributes = jasmine.createSpy()
      builder.getViewAttributes("a string argument")
      builder.getViewAttributes()
      expect(builder.viewAttributes).toHaveBeenCalledWith "a string argument"

  describe "#toEmber", ->
    it "delegates view creation to BalancedKit.lookup", ->
      builder = new TableCellBuilder
      spyOn(BalancedKit, "lookup")
      builder.viewAttributes = (string) ->
        string.toUpperCase()
      builder.toEmber("string")
      expect(BalancedKit.lookup).toHaveBeenCalledWith('view:balanced_kit/table_cells/blank_cell', "STRING")
