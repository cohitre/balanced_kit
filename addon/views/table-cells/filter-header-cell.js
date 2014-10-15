import Ember from "ember";;
import Template from "../../templates/table-cells/filter-header-cell";

var Filter, FilterHeaderCellView, isFilterAll;

isFilterAll = function(filterValue) {
  return _.include(["All", "all"], filterValue);
};

Filter = Ember.Object.extend({
  collectionValue: Ember.computed.oneWay("parent.filterValue"),
  isSelected: Ember.computed(function() {
    return this.get("collectionValue") === this.get("value");
  }).property("collectionValue", "value")
});

FilterHeaderCellView = Ember.View.extend({
  template: Template,
  tagName: "th",
  filters: Ember.computed.map("filterDefinitions", function(filter) {
    return FilterHeaderCellView.createFilter(this, filter.text, filter.value);
  })
});

FilterHeaderCellView.reopenClass({
  createFilter: function(parent, text, value) {
    return Filter.create({
      parent: parent,
      text: text,
      value: value
    });
  }
});

export default FilterHeaderCellView;
