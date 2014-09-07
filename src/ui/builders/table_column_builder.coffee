BaseViewBuilder = require("balanced/lib/base_view_builder").default
TableCellBuilder = require("balanced/ui/builders/table_cell_builder").default
TableHeaderBuilder = require("balanced/ui/builders/table_header_builder").default

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
