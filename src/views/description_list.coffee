`import Template from "balanced/templates/description_list"`

DescriptionList = Ember.View.extend
  template: Template
  tagName: "dl"
  dataPairs: Ember.computed "data", ->
    for label, value of @get("data")
      label: label
      value: value
  data:
    name: "cool"
    created_at: new Date

DescriptionList.reopenClass(
  DATA_TEMPLATES: {}
  registerDataTemplate: (templateName, callback) ->
    @DATA_TEMPLATES[templateName] = callback
    @
)

DescriptionList.registerDataTemplate "default", (object, pair) ->
  for key, value of object
    pair key, value

`export default DescriptionList`
