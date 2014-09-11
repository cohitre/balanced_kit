Template = require("balanced/ember/templates/table").default

isPresent = (propertyName) ->
  Ember.computed ->
    !Ember.isBlank(@get(propertyName))
  .property(propertyName)

TableView = Ember.View.extend
  template: Template
  tagName: "table"
  classNames: ["table"]

  columnsCount: Ember.computed.oneWay "columnBuilders.length"

`export default TableView`
