BaseViewBuilder = require("balanced/lib/base_view_builder").default
TableCellBuilder = require("balanced/ui/builders/table_cell_builder").default
TableHeaderBuilder = require("balanced/ui/builders/table_header_builder").default

class TableColumnBuilder
  @build: (callback) ->
    builder = new @()
    if _.isFunction callback
      callback(builder)
    builder

  header: (callback) ->
    @buildHeaderCallback = callback
    @

  cell: (callback) ->
    @buildCellCallback = callback
    @

  getHeaderBuilder: (args...) ->
    builder = new TableHeaderBuilder
    @buildHeaderCallback(builder, args...)
    builder

  getCellBuilder: (args...) ->
    builder = new TableCellBuilder
    @buildCellCallback(builder, args...)
    builder

`export default TableColumnBuilder`
