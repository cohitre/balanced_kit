`import TableBuilder from "./builders/table_builder"`
`import TableCellBuilder from "./builders/table_cell_builder"`

UiModule =
  dependencies:
    TableBuilder: TableBuilder
  table: (args...) ->
    @dependencies.TableBuilder.build(args...)

`export default UiModule`
