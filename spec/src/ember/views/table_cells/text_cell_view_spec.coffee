TextCellView = require('balanced/ember/views/table_cells/text_cell_view')['default']

describe "TextCellView", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should render", ->
      container = jasmine.container

      view = new TextCellView
      Ember.run ->
        view.set "text", "Important user"
        view.appendTo(container.get())

      expect(container.text()).toEqual "Important user"
