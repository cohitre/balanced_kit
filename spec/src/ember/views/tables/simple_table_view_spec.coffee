SimpleTableView = require('balanced/ember/views/tables/simple_table_view').default

describe 'SimpleTableView', ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()


  describe "#render", ->
    it "should render without errors", ->
      container = jasmine.container

      view = SimpleTableView.create(
        headerRowCellClasses: [
          Ember.View.extend(tagName: "th", classNames: ["column1"])
        ]
        bodyRowCellClasses: [
          Ember.View.extend(tagName: "td", classNames: ["cell1"])
        ]
        content: [90, 39, 218]
      )

      container.append view

      expect(container.$("thead th.column1").length).toBe 1
      expect(container.$("tbody tr td.cell1").length).toBe 3
