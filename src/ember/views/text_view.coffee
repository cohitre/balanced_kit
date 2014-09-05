`import Template from "../templates/text"`

TextView = Ember.View.extend
  template: Template
  isBlank: Ember.computed ->
    Ember.isBlank @get("text")
  .property("text")

`export default TextView`
