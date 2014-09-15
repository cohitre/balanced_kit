DeleteRowCellView = require('balanced/ember/views/table_cells/delete_row_cell_view').default

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
