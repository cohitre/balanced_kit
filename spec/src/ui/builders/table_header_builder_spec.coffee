TableHeaderBuilder = require('balanced/ui/builders/table_header_builder')['default']

describe "TableHeaderBuilder", ->
  describe "#getViewTemplateLookupKey", ->
    it "returns a template name with the right format", ->
      builder = new TableHeaderBuilder
      builder.template "blank"
      expect(builder.getViewTemplateLookupKey()).toEqual "view:balanced_kit/table_cells/blank_header_cell"
