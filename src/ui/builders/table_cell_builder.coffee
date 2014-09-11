BaseViewBuilder = require("balanced/lib/base_view_builder").default

class TableCellBuilder extends BaseViewBuilder
  @build: (callback, model) ->
    builder = new @
    if _.isFunction callback
      callback(builder, model)
    builder

  getViewTemplateLookupKey: ->
    "view:balanced_kit/table_cells/#{@templateName}_cell"

`export default TableCellBuilder`
