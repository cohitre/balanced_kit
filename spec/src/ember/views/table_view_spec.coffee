TableView = require('balanced/ember/views/table_view')['default']

describe "TableView", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#columnHeaderViews", ->
    mockBuilder = (emberView) ->
      getHeaderBuilder: ->
        toEmber: ->
          emberView

    it "gets the headerViews", ->
      view = TableView.create()
      expect(view.get("columnHeaderViews")).toEqual []

      Ember.run ->
        view.set("columnBuilders", [
          mockBuilder("view 1"),
          mockBuilder("view 2")
        ])
      expect(view.get("columnHeaderViews")).toEqual ["view 1", "view 2"]

  describe "#generateRowCellViews", ->
    mockBuilder = (prefix) ->
      getCellBuilder: (name) ->
        toEmber: ->
          "#{prefix} : #{name}"

    it "returns the cells for an object", ->
      view = TableView.create()
      expect(view.generateRowCellViews("Steve A. Test")).toEqual []

      Ember.run ->
        view.set "columnBuilders", [
          mockBuilder("cell 1"),
          mockBuilder("cell 2"),
        ]

      expect(view.generateRowCellViews("Steve A. Test")).toEqual [
        "cell 1 : Steve A. Test",
        "cell 2 : Steve A. Test"
      ]

  describe ".rowCellViews", ->
    mockBuilder = (prefix) ->
      getCellBuilder: (name) ->
        toEmber: ->
          "#{prefix} : #{name}"

    it "maps the objects to cell rows", ->
      view = TableView.create()
      expect(view.get("rowCellViews")).toEqual []

      Ember.run ->
        view.set "columnBuilders", [
          mockBuilder("cell 1"),
          mockBuilder("cell 2"),
        ]
        view.set "content", [
          "100",
          "200"
        ]

      expect(view.get("rowCellViews")).toEqual [
        ["cell 1 : 100", "cell 2 : 100"]
        ["cell 1 : 200", "cell 2 : 200"]
      ]

  describe "#render", ->
    registry = new Ember.Container
    registry.register("view:ember/container", Ember.ContainerView)

    mockColumnBuilder = (headerText, value) ->
      getHeaderBuilder: ->
        toEmber: ->
          Ember.View.extend(
            template: -> headerText
            tagName: "th"
          )
      getCellBuilder: (object) ->
        toEmber: ->
          Ember.View.extend(
            template: ->
              "#{value}: #{object[value]}"
            tagName: "td"
          )

    it "should render the data correctly", ->
      container = jasmine.container
      view = TableView.create(
        container: registry
        columnBuilders: [
          mockColumnBuilder("Name", "name")
          mockColumnBuilder("Age", "age")
        ]
      )

      Ember.run ->
        view.appendTo(container.get())

      Ember.run ->
        view.set("content", [{
          name: "elephant"
          age: 40
        }, {
          name: "crow",
          age: 7
        }])

      expect(container.$("th").eq(0).text()).toEqual "Name"
      expect(container.$("th").eq(1).text()).toEqual "Age"
      _.each ["name: elephant", "age: 40", "name: crow", "age: 7"], (text, i) ->
        expect(container.$("td").eq(i).text()).toEqual text
