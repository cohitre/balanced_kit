BaseViewBuilder = require("balanced/lib/base_view_builder").default

class TableCellBuilder extends BaseViewBuilder
  getViewTemplateLookupKey: ->
    "view:balanced_kit/table_cells/#{@templateName}_cell"

`export default TableCellBuilder`
