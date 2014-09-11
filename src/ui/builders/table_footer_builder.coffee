BaseViewBuilder = require("balanced/lib/base_view_builder").default

class TableFooterBuilder extends BaseViewBuilder
  @build: (callback) ->
    builder = new @
    if _.isFunction callback
      callback(builder)
    builder

`export default TableFooterBuilder`
