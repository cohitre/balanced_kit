`import SimpleTableView from "balanced-kit/views/tables/simple-table";`

describe 'SimpleTableView', ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should render without errors", ->
      container = jasmine.container

      view = SimpleTableView.create(
        container: new Ember.Container
        content: [90, 39, 218]
        headerRowCellClasses: [
          Ember.View.extend(tagName: "th", classNames: ["column1"])
        ]
        bodyRowCellClasses: [
          Ember.View.extend(tagName: "td", classNames: ["cell1"])
        ]
      )

      container.append view

      expect(container.$("thead th.column1").length).toBe 1
      expect(container.$("tbody tr td.cell1").length).toBe 3
