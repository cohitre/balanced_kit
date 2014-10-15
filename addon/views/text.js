import Ember from "ember";
import Template from "../templates/text";

var TextView = Ember.View.extend({
  template: Template,
  isBlank: Ember.computed(function() {
    return Ember.isBlank(this.get("text"));
  }).property("text")
});

export default TextView;
