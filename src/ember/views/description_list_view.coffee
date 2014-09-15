Template = require("balanced/ember/templates/description_list").default

DescriptionListView = Ember.View.extend
  template: Template
  tagName: "dl"
  dataPairs: Ember.computed "data", ->
    for label, value of @get("data")
      label: label
      value: value

`export default DescriptionListView`
