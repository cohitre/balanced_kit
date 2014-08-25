`import BaseView from "./base_view"`

class CollectionView extends BaseView
  toEmber: ->
    definition = _.extend({
      childViews: @value
    }, @elementDefinition)
    Ember.CollectionView.create(definition)

`export default CollectionView`
