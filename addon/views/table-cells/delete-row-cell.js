import Ember from "ember";
import Template from "../../templates/table-cells/delete-row-cell"

export default Ember.View.extend({
  template: Template,
  tagName: "td",
  isDisabled: false
});
