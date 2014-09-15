TableBuilder = require('balanced/ui/builders/table_builder')['default']

describe 'TableBuilder', ->
  describe '.build', ->
    it "should pass the callback to the initializer method", ->
      callback = jasmine.createSpy()
      TableBuilder.build("cool_table", callback)
      expect(callback).toHaveBeenCalled()

  describe '.constructor', ->
    it "should initialize some fields", ->
      builder = new TableBuilder("cool_table")
      expect(builder.tableName).toEqual "cool_table"
      expect(builder.headerRowCellClasses).toEqual Ember.A()
      expect(builder.bodyRowCellClasses).toEqual Ember.A()

  describe '#getBuilder', ->
    describe "head", ->
      it "gets an object that can be used to populate the table head", ->
        builder = (new TableBuilder()).getBuilder()
        expect(_.keys(builder.head)).toEqual ["cell", "text"]

      describe "#cell", ->
        it "delegates to pushCell", ->
          b = new TableBuilder()
          builder = b.getBuilder()
          spyOn(b, "pushCell")
          builder.head.cell("text", {})
          expect(b.pushCell).toHaveBeenCalledWith(b.headerRowCellClasses, "text", {}, "_header")

      describe "#text", ->
        it "delegates to pushCell", ->
          b = new TableBuilder()
          builder = b.getBuilder()
          spyOn(b, "pushCell")
          builder.head.text("kool-aid")
          expect(b.pushCell).toHaveBeenCalledWith(b.headerRowCellClasses, "text", { text: "kool-aid" }, "_header")

    describe "body", ->
      it "gets an object that can be used to populate the table body", ->
        builder = (new TableBuilder()).getBuilder()
        expect(_.keys(builder.body)).toEqual ["cell"]

      describe "#cell", ->
        it "delegates to pushCell", ->
          b = new TableBuilder()
          builder = b.getBuilder()
          spyOn(b, "pushCell")
          builder.body.cell("text", {})
          expect(b.pushCell).toHaveBeenCalledWith(b.bodyRowCellClasses, "text", {})


  describe "#executeInitializer", ->
    it "executes the callback with a builder", ->
      callback = jasmine.createSpy()
      b = new TableBuilder
      b.executeInitializer(callback)
      expect(callback).toHaveBeenCalled()

  describe "#buildCell", ->
    describe "(string class definition)", ->
      it "searches for the class and extends it", ->
        b = new TableBuilder()
        cellInstance = b.buildCell("text",
          classNames: ["important"]
        ).create()
        expect(cellInstance.get("classNames")).toEqual ["ember-view", "important"]

    describe "(class definition)", ->
      it "extends the class", ->
        b = new TableBuilder()
        definition =
          classNames: ["alert"]
        cellInstance = b.buildCell(Ember.View.extend(definition),
          classNames: ["important"]
        ).create()
        expect(cellInstance.get("classNames")).toEqual ["ember-view", "alert", "important"]

  describe "#buildCell", ->
    it "defines the cell and adds it to the array", ->
      array = Ember.A()
      b = new TableBuilder()
      b.pushCell(array, "text")
      expect(array.get("length")).toBe 1

    it "knows about suffixed cells", ->
      array = Ember.A()
      b = new TableBuilder()
      b.pushCell(array, "text", {}, "_header")
      expect(array.get("length")).toBe 1

  describe "#toEmberClass", ->
    it "requires the table and extends it", ->
      b = new TableBuilder("simple")
      b.pushCell(b.headerRowCellClasses, "text",
        text: "cool"
      )
      result = b.toEmberClass().create()
      expect(result.get("headerRowCellClasses.length")).toBe 1
