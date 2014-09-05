EmptyHeaderCellView = require('balanced/ember/views/table_cells/empty_header_cell_view')['default']

describe "EmptyHeaderCellView", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should be empty", ->
      view = new EmptyHeaderCellView
      Ember.run ->
        view.appendTo(jasmine.container.get())

      expect($.trim(view.$().text())).toEqual ""
