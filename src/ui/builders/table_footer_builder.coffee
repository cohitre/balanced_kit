BaseViewBuilder = require("balanced/lib/base_view_builder").default

class TableFooterBuilder extends BaseViewBuilder
  toEmber: ->
    key = @getViewTemplateLookupKey()
    attributes = _.extend({}, @prop(), @attr())
    klass = BalancedKit.container.lookupFactory(key)
    klass.extend(attributes)

`export default TableFooterBuilder`
