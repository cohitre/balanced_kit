`import TextHeaderCellView from 'balanced-kit/views/table-cells/text-header-cell';`

describe "TextHeaderCellView", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should render", ->
      container = jasmine.container
      view = new TextHeaderCellView
      Ember.run ->
        view.set("text", "Hello")
        view.appendTo(container.get())

      expect(container.text()).toEqual "Hello"
