Template = require("balanced/ember/templates/table_cells/date_cell").default

DateCellView = Ember.View.extend
  template: Template
  tagName: "td"
  classNames: ["cell-line-2"]
  dateString: Ember.computed "date", ->
    moment(@get("date")).format("MMM D, YYYY")
  timeString: Ember.computed "date", ->
    moment(@get("date")).format("h:mm a")

`export default DateCellView`
