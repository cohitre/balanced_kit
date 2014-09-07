BaseViewBuilder = require("balanced/lib/base_view_builder").default
TableView = require("balanced/ember/views/table_view").default
TableColumnBuilder = require("balanced/ui/builders/table_column_builder").default

class TableBuilder extends BaseViewBuilder
  @build: (args...) ->
    builder = new @
    if @isDefinition(args, "function")
      args[0](builder)
    builder

  columnBuilder: TableColumnBuilder
  emberTableView: TableView

  constructor: ->
    @columns = []

  column: (args...) ->
    @columns.push @columnBuilder.build(args...)

  toEmber: ->
    @emberTableView.extend(
      columnBuilders: @columns
    )

`export default TableBuilder`
