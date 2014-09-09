BaseViewBuilder = require("balanced/lib/base_view_builder").default
TableView = require("balanced/ember/views/table_view").default
TableColumnBuilder = require("balanced/ui/builders/table_column_builder").default
TableFooterBuilder = require("balanced/ui/builders/table_footer_builder").default

class TableBuilder extends BaseViewBuilder
  @build: (callback) ->
    builder = new @
    if _.isFunction callback
      callback(builder)
    builder

  columnBuilder: TableColumnBuilder
  emberTableView: TableView

  constructor: ->
    @columns = []

  column: (args...) ->
    column = @columnBuilder.build(args...)
    @columns.push column
    column

  footer: (callback) ->
    @footerCallback = callback

  getFooterBuilder: ->
    builder = new TableFooterBuilder
    @footerCallback(builder)
    builder

  toEmber: ->
    @emberTableView.extend(
      columnBuilders: Ember.A(@columns)
      footerContentBuilder: @getFooterBuilder()
    )

`export default TableBuilder`
