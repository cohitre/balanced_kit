import Ember from "ember";
import Template from "../../templates/tables/api-results-table";

var ApiResultsTableView = Ember.View.extend({
  template: Template,
  classNames: ["table"],
  tagName: "table",
  columnsCount: Ember.computed.oneWay("bodyRowCellClasses.length"),
  content: Ember.computed.oneWay("model.results"),
  hasNext: Ember.computed.oneWay("model.hasNext"),
  isLoading: Ember.computed.oneWay("model.isLoading")
});

export default ApiResultsTableView;
