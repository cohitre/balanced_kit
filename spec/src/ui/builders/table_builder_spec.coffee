TableBuilder = require('balanced/ui/builders/table_builder')['default'];

describe 'TableBuilder', ->
  describe ".build", ->
    it "creates a builder when no arguments are passed", ->
      result = TableBuilder.build()
      expect(result.constructor).toEqual TableBuilder

    it "executes the callback when a function is passed", ->
      callback = jasmine.createSpy()
      result = TableBuilder.build callback
      expect(callback).toHaveBeenCalledWith result

  describe "#column", ->
    it "adds a new column", ->
      builder = new TableBuilder
      expect(builder.columns.length).toBe 0
      builder.column()
      expect(builder.columns.length).toBe 1

    it "delegates to the columnBuilder", ->
      builder = new TableBuilder
      builder.columnBuilder =
        build: jasmine.createSpy()
      builder.column(1, 2, 3)
      expect(builder.columnBuilder.build).toHaveBeenCalledWith(1, 2, 3)

      builder.column()
      expect(builder.columnBuilder.build).toHaveBeenCalledWith()

  describe "#toEmber", ->
    it "creates a subclass of TableView", ->
      builder = new TableBuilder
      builder.emberTableView =
        extend: jasmine.createSpy()
      result = builder.toEmber()
      expect(builder.emberTableView.extend.calls.argsFor(0)[0].columnBuilders)
        .toBe builder.columns
