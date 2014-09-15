ButtonLinkView = require('balanced/ember/views/button_link_view').default

describe 'ButtonLinkView', ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "displays the text", ->
      view = ButtonLinkView.create(
        text: "Do something important"
      )

      Ember.run ->
        view.appendTo jasmine.container.get()

      expect(jasmine.container.text()).toBe "Do something important"

    it "can display empty text", ->
      view = ButtonLinkView.create()

      Ember.run ->
        view.appendTo jasmine.container.get()

      expect(jasmine.container.text()).toBe ""
