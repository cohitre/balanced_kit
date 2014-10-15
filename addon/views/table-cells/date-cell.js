import Ember from "ember";
import Template from "../../templates/table-cells/date-cell";

var DateCellView = Ember.View.extend({
  template: Template,
  tagName: "td",
  classNames: ["cell-line-2"],
  dateString: Ember.computed("date", function() {
    return moment(this.get("date")).format("MMM D, YYYY");
  }),
  timeString: Ember.computed("date", function() {
    return moment(this.get("date")).format("h:mm a");
  })
});

export default DateCellView;
