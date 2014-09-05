HeavyLightCellView = require('balanced/ember/views/table_cells/heavy_light_cell_view')['default']

describe "HeavyLightCellView", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should have the correct markup", ->
      container = jasmine.container

      view = new HeavyLightCellView

      Ember.run ->
        view.set "primaryText", "Big Bird"
        view.set "secondaryText", "111 Sesame St."
        view.appendTo(container.get())

      expect($.trim(view.$(".text-heavy").text())).toEqual "Big Bird"
      expect($.trim(view.$(".text-light").text())).toEqual "111 Sesame St."
