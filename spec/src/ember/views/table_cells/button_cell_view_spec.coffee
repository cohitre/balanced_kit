ButtonCellView = require('balanced/ember/views/table_cells/button_cell_view').default

describe 'ButtonCellView', ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should render without errors", ->
      container = jasmine.container
      view = ButtonCellView.create(
        text: "Important button"
      )

      Ember.run ->
        view.appendTo(container.get())

      expect(container.text("a.btn.btn-info")).toEqual "Important button"
