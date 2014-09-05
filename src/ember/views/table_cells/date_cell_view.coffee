`import Template from "../../templates/table_cells/heavy_light_cell"`

DateCellView = Ember.View.extend
  template: Template
  tagName: "td"
  primaryText: Ember.computed "date", ->
    moment(@get("date")).format("MMM D, YYYY")
  secondaryText: Ember.computed "date", ->
    moment(@get("date")).format("h:mm a")

`export default DateCellView`
