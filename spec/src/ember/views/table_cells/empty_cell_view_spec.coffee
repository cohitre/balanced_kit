EmptyCellView = require('balanced/ember/views/table_cells/empty_cell_view')['default']

describe "EmptyCellView", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should be empty", ->
      view = new EmptyCellView
      Ember.run ->
        view.appendTo(jasmine.container.get())

      expect($.trim(view.$().text())).toEqual ""
