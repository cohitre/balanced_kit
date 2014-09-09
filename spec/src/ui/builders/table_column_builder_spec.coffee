TableColumnBuilder = require('balanced/ui/builders/table_column_builder')['default']

describe 'TableColumnBuilder', ->
  subject = ->
    new TableColumnBuilder

  describe "#build", ->
    it "should accept a callback function", ->
      callback = jasmine.createSpy()
      builder = TableColumnBuilder.build(callback)
      expect(callback).toHaveBeenCalledWith(builder)

  describe "#header", ->
    it "sets the buildHeaderCallback", ->
      method = ->
      builder = subject()
      builder.header method
      expect(builder.buildHeaderCallback).toBe method

  describe "#cell", ->
    it "sets the buildCellCallback", ->
      method = ->
      builder = subject()
      builder.cell method
      expect(builder.buildCellCallback).toBe method

  describe "#getHeaderBuilder", ->
    it "executes the callback", ->
      builder = subject()
      builder.buildHeaderCallback = jasmine.createSpy()
      header = builder.getHeaderBuilder()
      expect(builder.buildHeaderCallback).toHaveBeenCalledWith(header)

    it "creates a TableHeaderBuilder and executes the callback", ->
      builder = subject()
      builder.buildHeaderCallback = jasmine.createSpy()
      header = builder.getHeaderBuilder(1)
      expect(builder.buildHeaderCallback).toHaveBeenCalledWith(header, 1)

  describe "#getCellBuilder", ->
    it "executes the callback", ->
      builder = subject()
      builder.buildCellCallback = jasmine.createSpy()
      cell = builder.getCellBuilder()
      expect(builder.buildCellCallback).toHaveBeenCalledWith(cell)

    it "creates a TableCellBuilder and executes the callback", ->
      builder = subject()
      builder.buildCellCallback = jasmine.createSpy()
      cell = builder.getCellBuilder(1)
      expect(builder.buildCellCallback).toHaveBeenCalledWith(cell, 1)
