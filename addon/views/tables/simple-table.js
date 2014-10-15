import Ember from "ember";
import Template from "../../templates/tables/simple-table";

var SimpleTableView = Ember.View.extend({
  template: Template,
  classNames: ["table"],
  tagName: "table",
})

export default SimpleTableView;
