`import ButtonCellView from 'balanced-kit/views/table-cells/button-cell';`

describe 'ButtonCellView', ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should render without errors", ->
      container = jasmine.container
      view = ButtonCellView.create(
        container: new Ember.Container
        text: "Important button"
      )

      Ember.run ->
        view.appendTo(container.get())

      expect(container.text("a.btn.btn-info")).toEqual "Important button"
