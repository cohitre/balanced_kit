class LiteralView
  @build: (tagName, text) ->
    v = new @(tagName, text)
    v.render()

  constructor: (@tagName, @text) ->

  render: ->
    Ember.View.create
      tagName: @tagName
      template: =>
        @text

`export default LiteralView`
