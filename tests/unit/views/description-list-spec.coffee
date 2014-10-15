`import DescriptionList from "balanced-kit/views/description-list";`

describe "DescriptionList", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "tagName", ->
    it "should be dl", ->
      subject = DescriptionList.create(
        container: new Ember.Container()
      )
      expect(subject.get("tagName")).toBe "dl"

  describe "#dataPairs", ->
    it "returns an empty array when there's no data", ->
      list = DescriptionList.create(
        container: new Ember.Container()
      )
      expect(list.get("dataPairs")).toEqual []

    it "returns an array of data pairs objects",->
      list = DescriptionList.create(
        container: new Ember.Container()
        data:
          name: "Important Marketplace"
          id: "MPxxxxxxxxxxxxxxx"
      )
      expect(list.get("dataPairs")).toEqual [{
        label: "name"
        value: "Important Marketplace"
      }, {
        label: "id"
        value: "MPxxxxxxxxxxxxxxx"
      }]

  describe "#render", ->
    it "renders the data with the default template", ->
      container = jasmine.container
      view = DescriptionList.create
        container: new Ember.Container()
        data:
          name: "Kermit Frog"
          animal: "frog"

      Ember.run ->
        view.appendTo(container.get())

      expect(container.$("dl").length).toBe 1
      expect(container.$("dd").length).toBe 2

      Ember.run ->
        view.set("data", name: "Miss Piggy")
      expect(container.$("dd").length).toBe 1
