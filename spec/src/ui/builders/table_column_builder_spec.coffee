TableColumnBuilder = require('balanced/ui/builders/table_column_builder')['default']

describe 'TableColumnBuilder', ->
  describe "#build", ->
    it "defaults to blank values", ->
      builder = TableColumnBuilder.build()
      expect(builder.headerBuilder.viewTemplate).toEqual "blank"
      expect(builder.headerBuilder.viewAttributes).toEqual({})

      expect(builder.cellBuilder.viewTemplate).toEqual "blank"
      expect(builder.cellBuilder.viewAttributes()).toEqual(undefined)

    it "should accept a callback function", ->
      callback = jasmine.createSpy()
      builder = TableColumnBuilder.build(callback)
      expect(callback).toHaveBeenCalledWith(builder)

    it "initializes the header and cell to strings", ->
      builder = TableColumnBuilder.build("Name", "Stella")
      expect(builder.headerBuilder.viewTemplate).toEqual "text"
      expect(builder.headerBuilder.viewAttributes).toEqual(
        text: "Name"
      )

      expect(builder.cellBuilder.viewTemplate).toEqual "text"
      expect(builder.cellBuilder.viewAttributes()).toEqual(
        text: "Stella"
      )

  describe "#header", ->
    it "returns a header builder", ->
      builder = TableColumnBuilder.build()
      builder.header("text",
        text: "Header"
      )
      result = builder.headerBuilder
      expect(result.viewTemplate).toEqual "text"
      expect(result.viewAttributes).toEqual {
        text: "Header"
      }

  describe "#cell", ->
    it "returns a cell builder", ->
      builder = TableColumnBuilder.build()
      builder.cell("static",
        text: "Oh! Static"
      )
      result = builder.cellBuilder
      expect(result.viewTemplate).toEqual "static"
      expect(result.viewAttributes()).toEqual {
        text: "Oh! Static"
      }
