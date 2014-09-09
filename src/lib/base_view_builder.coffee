accessor = (object, hash, args) ->
  name = args[0]
  value = args[1]

  if args.length == 0
    return hash
  else if args.length == 1 && _.isString(name)
    return hash[name]
  else if args.length == 1 && _.isObject(name)
    _.extend hash, name
  else if args.length == 2
    hash[name] = value
  return object

class BaseViewBuilder
  constructor: ->
    @properties = {}
    @attributes = {}
    @templateName = null

  template: (value) ->
    if arguments.length == 1
      @templateName = value
      return @
    else
      return @templateName

  text: (text) ->
    @properties.text = text
    @

  prop: ->
    accessor(@, @properties, arguments)

  attr: ->
    accessor(@, @attributes, arguments)

  addClass: (classStrings) ->
    str = @prop("classNames") || ""
    @prop "classNames", $.trim("#{str} #{classStrings}")
    @

  getViewTemplateLookupKey: ->
    "view:balanced_kit/#{@templateName}"

  toEmber: ->
    key = @getViewTemplateLookupKey()
    attributes = _.extend({}, @prop(), @attr())
    BalancedKit.lookup(key, attributes)

`export default BaseViewBuilder`
