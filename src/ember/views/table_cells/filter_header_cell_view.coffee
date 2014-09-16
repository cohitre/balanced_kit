Template = require("balanced/ember/templates/table_cells/filter_header_cell").default

isFilterAll = (filterValue) ->
  _.include ["All", "all"], filterValue

FilterHeaderCellView = Ember.View.extend
  template: Template
  tagName: "th"

  filters: Ember.computed.map "filterDefinitions", (filter) ->
    FilterHeaderCellView.createFilter(@, filter.text, filter.value)

Filter = Ember.Object.extend
  collectionValue: Ember.computed.oneWay("parent.filterValue")
  isSelected: Ember.computed(->
    @get("collectionValue") == @get("value")
  ).property("collectionValue", "value")

FilterHeaderCellView.reopenClass(
  createFilter: (parent, text, value) ->
    Filter.create(
      parent: parent
      text: text
      value: value
    )
)

`export default FilterHeaderCellView`
