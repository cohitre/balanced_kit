`import LiteralView from "./literal_view"`

EmberDefinitionListView = Ember.ContainerView.extend
  tagName: "dl",
  classNameBindings: [":dl-horizontal"]

  add: (label, value) ->
    @pushObject LiteralView.build("dt", label)
    @pushObject LiteralView.build("dd", value)

class DescriptionListView
  constructor: ->
    @listItems = []

  build: (listName, data) ->
    BalancedKit.view.executeBuilder "descriptionList", listName, data, @

  attr: (@attributes) ->

  add: (label, value) ->
    @listItems.push
      label: label
      value: value

  render: ->
    @build(@attributes.data, @attributes.listName)
    view = EmberDefinitionListView.create()
    for item in @listItems
      view.add item.label, item.value
    view

`export default DescriptionListView`
