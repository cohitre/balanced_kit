TableBuilder = require("balanced/ui/builders/table_builder").default
TableRowBuilder = require("balanced/ui/builders/table_row_builder").default

UiModule =
  dependencies:
    TableBuilder: TableBuilder
  table: (args...) ->
    @dependencies.TableBuilder.build(args...)

UiModule.table.row = (callback) ->
  TableRowBuilder.build(callback).toEmberClass()

`export default UiModule`
