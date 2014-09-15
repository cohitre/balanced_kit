FilterHeaderCellView = require('balanced/ember/views/table_cells/filter_header_cell_view')['default']

describe 'FilterHeaderCellView', ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should render the trigger link", ->
      view = FilterHeaderCellView.create(
        text: "Extreme link"
        isSelected: true
      )
      jasmine.container.append view
      expect(jasmine.container.$("a.dropdown-toggle.active").length).toEqual 1
      expect(jasmine.container.text("a.dropdown-toggle")).toEqual "Extreme link"

    it "should render the filters", ->
      view = FilterHeaderCellView.create(
        text: "Extreme link"
        filterName: "status"
        filters: Ember.A([{
          text: "Pending"
          isSelected: false
          value: "pending"
        }, {
          text: "Failed"
          isSelected: true
          value: "failed"
        }])
      )
      jasmine.container.append view
      expect(jasmine.container.$(".dropdown-menu li").length).toEqual 2
      expect(jasmine.container.text("a.active")).toEqual "Failed"
