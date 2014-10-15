`import EmptyHeaderCellView from 'balanced-kit/views/table-cells/empty-header-cell';`

describe "EmptyHeaderCellView", ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should be empty", ->
      view = new EmptyHeaderCellView
      Ember.run ->
        view.appendTo(jasmine.container.get())

      expect(jasmine.container.text()).toEqual ""
