`import EmptyCellView from 'balanced-kit/views/table-cells/empty-cell';`

describe "EmptyCellView", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should be empty", ->
      view = new EmptyCellView
      Ember.run ->
        view.appendTo(jasmine.container.get())

      expect(jasmine.container.text()).toEqual ""
