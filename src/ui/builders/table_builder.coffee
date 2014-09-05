`import BaseViewBuilder from "balanced/lib/base_view_builder"`
`import TableView from "balanced/ember/views/table_view"`
`import TableColumnBuilder from "./table_column_builder"`

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
