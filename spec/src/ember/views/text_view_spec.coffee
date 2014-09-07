TextView = require('balanced/ember/views/text_view')['default']

describe 'TextView', ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "displays the text", ->
      container = jasmine.container
      view = TextView.create(
        classNameBindings: [":sample"]
      )

      Ember.run ->
        view.appendTo(container.get())

      expect(container.text(".sample")).toBe ""

      Ember.run ->
        view.set("text", "Miss Piggy")
      expect(container.text(".sample")).toBe "Miss Piggy"

  describe "#isBlank", ->
    it "should be true when there's no text", ->
      view = new TextView
      expect(view.get("isBlank")).toBe true
      Ember.run ->
        view.set("text", "some text")
      expect(view.get("isBlank")).toBe false

  describe "#render", ->
    it "should render placeholder text", ->
      container = jasmine.container
      view = new TextView
      Ember.run ->
        view.set "placeholderText", "Anonymous User"
        view.appendTo(container.get())

      expect(container.text(".text-placeholder")).toEqual "Anonymous User"

    it "should have the correct markup", ->
      container = jasmine.container

      view = new TextView
      Ember.run ->
        view.set "text", "Important user"
        view.appendTo(container.get())

      expect(container.text()).toEqual "Important user"
