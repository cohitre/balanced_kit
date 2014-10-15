`import ButtonLinkView from 'balanced-kit/views/button-link';`

describe 'ButtonLinkView', ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "displays the text", ->
      view = ButtonLinkView.create(
        container: new Ember.Container()
        text: "Do something important"
      )

      Ember.run ->
        view.appendTo jasmine.container.get()

      expect(jasmine.container.text()).toBe "Do something important"

    it "can display empty text", ->
      view = ButtonLinkView.create(
        container: new Ember.Container()
      )

      Ember.run ->
        view.appendTo jasmine.container.get()

      expect(jasmine.container.text()).toBe ""
