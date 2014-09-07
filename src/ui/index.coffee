TableBuilder = require("balanced/ui/builders/table_builder").default
TableCellBuilder = require("balanced/ui/builders/table_cell_builder").default

UiModule =
  dependencies:
    TableBuilder: TableBuilder
  table: (args...) ->
    @dependencies.TableBuilder.build(args...)

`export default UiModule`
