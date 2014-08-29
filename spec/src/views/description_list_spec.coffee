`import DescriptionList from "balanced/views/description_list"`

describe "DescriptionList", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe ".registerDataTemplate", ->
    it "should add the template to the DATA_TEMPLATES dictionary", ->
      method = ->
      DescriptionList.registerDataTemplate "test", method
      expect(DescriptionList.DATA_TEMPLATES.test).toBe method

  describe "tagName", ->
    it "should be dl", ->
      expect(DescriptionList.create().get("tagName")).toBe "dl"

  describe "#render", ->
    it "renders the data with the default template", ->
      view = DescriptionList.create(
        data:
          name: "Kermit Frog"
          animal: "frog"
      )

      container = jasmine.container

      Ember.run ->
        view.appendTo(container.get())

      expect(container.$("dl").length).toBe 1
      expect(container.$("dd").length).toBe 2

      Ember.run ->
        view.set("data", name: "Miss Piggy")
      expect(container.$("dd").length).toBe 1
