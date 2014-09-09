Template = require("balanced/ember/templates/table").default

TableView = Ember.View.extend
  template: Template
  tagName: "table"
  columnHeaderViews: Ember.computed.map "columnBuilders", (builder) ->
    builder.getHeaderBuilder().toEmber()

  generateRowCellViews: (object) ->
    columns = @get("columnBuilders") || []
    for builder in columns
      builder.getCellBuilder(object).toEmber()

  rowCellViews: Ember.computed.map "content", (object) ->
    @generateRowCellViews(object)

  columnsCount: Ember.computed.oneWay "columnBuilders.length"

  hasFooter: true # Ember.computed.gt("footerViews.length", 0)

  footerContainer: Ember.ContainerView.extend(
    attributeBindings: ["colspan"]
    tagName: "td"
  )

  footerCells: Ember.computed(->
    Ember.A([this.get("footerContentBuilder").toEmber()])
  ).property()

`export default TableView`
