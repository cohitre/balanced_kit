getView = (name) ->
  path = "view:balanced_kit/#{name}"
  BalancedKit.container.lookupFactory(path)

class TableBuilder
  @build: (name, callback) ->
    builder = new @(name)
    builder.executeInitializer(callback)
    builder

  constructor: (@tableName) ->
    @headerRowCellClasses = Ember.A()
    @bodyRowCellClasses = Ember.A()

  getBuilder: ->
    builder =
      head:
        cell: (klass, extensions) =>
          @pushCell(@headerRowCellClasses, klass, extensions, "_header")
        text: (text, extensions) ->
          extensions = _.extend(text: text, extensions)
          @cell("text", extensions)

      body:
        cell: (klass, extensions) =>
          @pushCell(@bodyRowCellClasses, klass, extensions)

  executeInitializer: (callback) ->
    callback @getBuilder()

  buildCell: (klass, extensions={}, nameSuffix="") ->
    if _.isString(klass)
      klass = getView("table_cells/#{klass}#{nameSuffix}_cell")
    klass.extend(extensions)

  pushCell: (array, klass, extensions, nameSuffix="") ->
    array.pushObject @buildCell(klass, extensions, nameSuffix)
    @

  toEmberClass: ->
    TableView = getView("tables/#{@tableName}_table")
    return TableView.extend(
      headerRowCellClasses: @headerRowCellClasses
      bodyRowCellClasses: @bodyRowCellClasses
    )

`export default TableBuilder`
