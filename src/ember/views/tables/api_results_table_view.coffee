TEMPLATE = require("balanced/ember/templates/tables/api_results_table").default

ApiResultsTableView = Ember.View.extend(
  classNames: ["table"]
  tagName: "table"
  template: TEMPLATE
  columnsCount: Ember.computed.oneWay("bodyRowCellClasses.length")

  content: Ember.computed.oneWay("model.results")
  hasNext: Ember.computed.oneWay("model.hasNext")
  isLoading: Ember.computed.oneWay("model.isLoading")
)

`export default ApiResultsTableView`
