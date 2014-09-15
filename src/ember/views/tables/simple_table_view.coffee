TEMPLATE = require("balanced/ember/templates/tables/simple_table").default

SimpleTableView = Ember.View.extend(
  classNames: ["table"]
  tagName: "table"
  template: TEMPLATE
)

`export default SimpleTableView`
