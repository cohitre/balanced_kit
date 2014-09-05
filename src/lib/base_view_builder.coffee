TYPE_MAPPINGS =
  string: _.isString
  function: _.isFunction
  object: _.isObject
  array: _.isArray
  blank: (value) ->
    _.isUndefined(value) || _.isNull(value)
  number: _.isNumber
  date: _.isDate

class BaseViewBuilder
  @isDefinition: (args, types...) ->
    (args.length == types.length) && _.every(args, (value, index) =>
      @isType(types[index], value)
    )

  @isType: (type, value) ->
    testMethod = TYPE_MAPPINGS[type]
    testMethod && testMethod(value)

  getViewAttributes: ->
    @viewAttributes

  getViewTemplateLookupKey: ->
    "view:balanced_kit/#{@viewTemplate}"

  toEmber: ->
    key = @getViewTemplateLookupKey()
    attributes = @getViewAttributes()
    BalancedKit.lookup(key, attributes)

`export default BaseViewBuilder`
