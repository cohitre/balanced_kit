import Ember from "ember";
import Template from "../templates/description-list";

var DescriptionListView = Ember.View.extend({
  template: Template,
  tagName: "dl",
  dataPairs: Ember.computed(function() {
    var label;
    var pairs = [];
    var data = this.get("data");

    for (label in data) {
      pairs.push({
        label: label,
        value: data[label]
      });
    }

    return pairs;
  }).property("data")
});

export default DescriptionListView;
