BaseViewBuilder = require("balanced/lib/base_view_builder").default
TableView = require("balanced/ember/views/table_view").default
TableRowBuilder = require("balanced/ui/builders/table_row_builder").default

rowsToEmberClasses = (rows) ->
  array = for row in rows
    row.toEmberClass()
  Ember.A array

class TableBuilder extends BaseViewBuilder
  @build: (callback) ->
    builder = new @
    if _.isFunction callback
      callback(builder)
    builder

  constructor: ->
    super()
    @theadRowBuilders = []
    @tfootRowBuilders = []
    @tbodyRowBuilders = []

    @head =
      row: (callback) =>
        @theadRowBuilders.push TableRowBuilder.build(callback)
        @

    @foot =
      row: (callback) =>
        @tfootRowBuilders.push TableRowBuilder.build(callback)
        @
      button: (text, clickAction) =>
        builder = TableRowBuilder.build (rowBuilder) =>
          rowBuilder.cell (row) =>
            Ember.ContainerView.create(
              tagName: "td"
              attributeBindings: ["colspan"]
              colspan: @theadRowBuilders[0].cellCallbacks.length
              childViews: [
                BalancedKit.lookup("view:balanced_kit/button_link",
                  content: row.get("content")
                  text: text
                  click: clickAction
                )
              ]
            )
        @tfootRowBuilders.push builder
        @


    @body =
      row: (callback) =>
        @tbodyRowBuilders.push TableRowBuilder.build(callback)
        @

  toEmberClass: ->
    TableView.extend
      tbodyRowViews: rowsToEmberClasses(@tbodyRowBuilders)
      tfootRowViews: rowsToEmberClasses(@tfootRowBuilders)
      theadRowViews: rowsToEmberClasses(@theadRowBuilders)

`export default TableBuilder`
