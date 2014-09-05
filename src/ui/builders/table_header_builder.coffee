`import BaseViewBuilder from "balanced/lib/base_view_builder"`
`import TextHeaderCellView from "balanced/ember/views/table_cells/text_header_cell_view"`

class TableHeaderBuilder extends BaseViewBuilder
  @build: (args...) ->
    builder = new @
    if @isDefinition(args, "string")
      builder.template(args[0])
    else if @isDefinition(args, "string", "string")
      builder.template(args[0])
      builder.attributes ->
        text: args[1]
    else if @isDefinition(args, "string", "object")
      builder.template(args[0])
      builder.attributes(-> args[1])
    builder

  constructor: ->
    @viewTemplate = "blank"
    @viewAttributes = {}

  template: (@viewTemplate) ->
    @

  attributes: (callback) ->
    @viewAttributes = callback()
    @

  getViewTemplateLookupKey: ->
    "view:balanced_kit/table_cells/#{@viewTemplate}_header_cell"

`export default TableHeaderBuilder`
