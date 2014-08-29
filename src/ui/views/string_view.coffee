`import BaseView from "./base_view"`

class StringView extends BaseView
  toEmber: ->
    definition = _.extend({
      template: =>
        @value
    }, @elementDefinition)
    Ember.View.create(definition)

`export default StringView`
