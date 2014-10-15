import Ember from "ember";
import Template from "../../templates/table-cells/button-cell";

var ButtonCellView = Ember.View.extend({
  template: Template,
  tagName: "td"
});

export default ButtonCellView;
