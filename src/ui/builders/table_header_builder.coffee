BaseViewBuilder = require("balanced/lib/base_view_builder").default
TextHeaderCellView = require("balanced/ember/views/table_cells/text_header_cell_view").default

class TableHeaderBuilder extends BaseViewBuilder
  getViewTemplateLookupKey: ->
    "view:balanced_kit/table_cells/#{@template()}_header_cell"

`export default TableHeaderBuilder`
