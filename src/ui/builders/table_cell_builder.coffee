`import BaseViewBuilder from "balanced/lib/base_view_builder"`

class TableCellBuilder extends BaseViewBuilder
  @build: (args...) ->
    builder = new @
    if @isDefinition(args, "string")
      builder.template(args[0])
    else if @isDefinition(args, "string", "string")
      builder.template args[0]
      builder.attributes(-> text: args[1])
    else if @isDefinition(args, "string", "function")
      builder.template args[0]
      builder.attributes args[1]
    else if @isDefinition(args, "string", "object")
      builder.template args[0]
      builder.attributes ->
        return args[1]
    builder

  constructor: ->
    @template "blank"
    @viewAttributes = ->

  template: (@viewTemplate) ->
    @

  attributes: (@viewAttributes) ->
    @

  getViewTemplateLookupKey: ->
    "view:balanced_kit/table_cells/#{@viewTemplate}_cell"

  getViewAttributes: (object) ->
    @viewAttributes(object)

  toEmber: (object) ->
    key = @getViewTemplateLookupKey()
    attributes = @getViewAttributes(object)
    BalancedKit.lookup(key, attributes)

`export default TableCellBuilder`
