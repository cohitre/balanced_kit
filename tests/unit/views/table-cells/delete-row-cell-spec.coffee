`import DeleteRowCellView from 'balanced-kit/views/table-cells/delete-row-cell';`

describe 'DeleteRowCellView', ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    it "should render without errors", ->
      view = DeleteRowCellView.create()
      jasmine.container.append view
      expect(jasmine.container.$("a i.icon-table-x").length).toEqual 1

    it "should not render the button when isDisabled", ->
      view = DeleteRowCellView.create(
        isDisabled: true
      )
      jasmine.container.append view
      expect(jasmine.container.$("a i.icon-table-x").length).toEqual 0
