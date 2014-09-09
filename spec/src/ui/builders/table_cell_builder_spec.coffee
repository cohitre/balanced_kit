TableCellBuilder = require('balanced/ui/builders/table_cell_builder')['default']

describe "TableCellBuilder", ->
  describe "#getViewTemplateLookupKey", ->
    it "looks up the proper template", ->
      builder = new TableCellBuilder
      builder.template "jail"
      expect(builder.getViewTemplateLookupKey()).toEqual "view:balanced_kit/table_cells/jail_cell"
