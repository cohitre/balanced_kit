stringView = (definition , text) ->
  definition = _.extend({
    template: -> text
  }, definition)
  Ember.View.create definition

arrayView = (definition, children) ->
  definition = _.extend({
    childViews: children
  }, definition)
  Ember.ContainerView.create definition


class BaseView
  constructor: (@value) ->
  setElementDefinition: (@elementDefinition) ->

  el: (definition, children) ->
    if _.isString(definition)
      definition =
        tagName: definition

    if _.isArray(children)
      arrayView(definition, children)
    else if _.isString(children) || _.isUndefined(children) || _.isNull(children)
      stringView(definition, children)

`export default BaseView`
