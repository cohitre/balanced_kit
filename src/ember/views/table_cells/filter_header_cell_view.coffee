Template = require("balanced/ember/templates/table_cells/filter_header_cell").default

isFilterAll = (filterValue) ->
  _.include ["All", "all"], filterValue

FilterHeaderCellView = Ember.View.extend
  template: Template
  tagName: "th"

  classNameBindings: [":dropdown", ":filter"],
  isSelected: false,

`export default FilterHeaderCellView`
