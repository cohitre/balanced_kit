`import Template from "../templates/description_list"`

DescriptionListView = Ember.View.extend
  template: Template
  tagName: "dl"
  dataPairs: Ember.computed "data", ->
    for label, value of @get("data")
      label: label
      value: value
  data:
    name: "cool"
    created_at: new Date

DescriptionListView.reopenClass(
  DATA_TEMPLATES: {}
  registerDataTemplate: (templateName, callback) ->
    @DATA_TEMPLATES[templateName] = callback
    @
)

DescriptionListView.registerDataTemplate "default", (object, pair) ->
  for key, value of object
    pair key, value

`export default DescriptionListView`
