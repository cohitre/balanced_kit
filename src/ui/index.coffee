UiModule =
  dependencies:
    TableBuilder: require("balanced/ui/builders/table_builder").default
  table: (name, callback) ->
    @dependencies.TableBuilder.build(name, callback).toEmberClass()

`export default UiModule`
