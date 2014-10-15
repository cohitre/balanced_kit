import Ember from "ember";

var LinkableElementView = Ember.View.extend({
  tagName: Ember.computed(function() {
    return this.get("isLink") ?
      "a" :
      "span";
  }).property("isLink")
});

export default LinkableElementView
