import TableRowView from "./table_row_view";
import template from "balanced/templates/table/layout";

var BaseView = Ember.View.extend({
  tagName: "table",
  layout: template,

  init: function() {
    var self = this;
    this._super();
  },

  theadRowView: Ember.computed(function() {
    var row = TableRowView.createForCells(this.get("theadCells"), {
      tagName: "th"
    });
    return Ember.ContainerView.create({
      tagName: "thead",
      childViews: [row]
    });
  }),

  theadCells: Ember.computed.map("content", function(item) {
    return this.buildRow(item);
  }),

  tableRowViews: Ember.computed.map("content", function(dataCell) {
    return TableRowView.createForCells(this.buildRow(dataCell));
  }),

  tbody: Ember.computed("tableRows", function() {
    return Ember.ContainerView.create({
      tagName: "tbody",
      childViews: this.get("tableRows")
    });
  }),
});

export {BaseView};
export default BaseView;
