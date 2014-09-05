`import Template from "balanced/ember/templates/table"`

TableView = Ember.View.extend
  template: Template
  tagName: "table"
  columnHeaderViews: Ember.computed.map "columnBuilders", (builder) ->
    builder.headerBuilder.toEmber()

  generateRowCellViews: (object) ->
    columns = @get("columnBuilders") || []
    for builder in columns
      builder.cellBuilder.toEmber(object)

  rowCellViews: Ember.computed.map "content", (object) ->
    @generateRowCellViews(object)

`export default TableView`
