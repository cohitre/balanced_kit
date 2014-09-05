TextHeaderCellView = require('balanced/ember/views/table_cells/text_header_cell_view')['default']

describe "TextHeaderCellView", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should render", ->
      container = jasmine.container
      view = new TextHeaderCellView
      Ember.run ->
        view.set("text", "Hello")
        view.appendTo(container.get())

      expect(container.text()).toEqual "Hello"
