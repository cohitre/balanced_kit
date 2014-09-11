TableRowClass = Ember.ContainerView.extend
  tagName: "tr"

class TableRowBuilder
  @build: (callback) ->
    builder = new @
    if _.isFunction callback
      callback(builder)
    builder

  cell: (callback) ->
    @cellCallbacks ||= []
    @cellCallbacks.push callback
    @

  textHeader: (text) ->
    @cellView "view:balanced_kit/table_cells/text_header_cell", ->
      text: text
    @

  cellView: (templateName, callback) ->
    @cell (rowView) ->
      attributes = callback(rowView)
      BalancedKit.lookup(templateName, attributes)

  dateCell: (callback) ->
    if _.isFunction callback
      @cellView("view:balanced_kit/table_cells/date_cell", callback)
    else if _.isDate callback
      @dateCell ->
        date: callback
    @

  textCell: (callback) ->
    if _.isFunction callback
      @cellView("view:balanced_kit/table_cells/text_cell", callback)
    else if _.isString callback
      @textCell ->
        text: callback
    @

  toEmberClass: ->
    callbacks = @cellCallbacks || []
    TableRowClass.extend
      init: ->
        @_super()
        cells = for callback in callbacks
          callback(@)
        @pushObjects cells

`export default TableRowBuilder`
