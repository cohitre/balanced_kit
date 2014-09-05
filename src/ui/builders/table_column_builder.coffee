`import BaseViewBuilder from "balanced/lib/base_view_builder"`
`import TableCellBuilder from "./table_cell_builder"`
`import TableHeaderBuilder from "./table_header_builder"`

class TableColumnBuilder extends BaseViewBuilder
  @build: (args...) ->
    builder = new @()
    if @isDefinition(args, "function")
      args[0](builder)
    else if @isDefinition(args, "string", "string")
      builder
        .header("text", args[0])
        .cell("text", args[1])
    builder

  constructor: ->
    @header()
    @cell()

  header: (args...) ->
    @headerBuilder = TableHeaderBuilder.build args...
    @

  cell: (args...) ->
    @cellBuilder = TableCellBuilder.build args...
    @

`export default TableColumnBuilder`
