UriUtils = require("balanced/lib/uri_utils").default
BalancedApiResponse = require("balanced/responses/balanced_api_response").default
QueryStringBuilder = require("balanced/lib/query_string_builder").default

isBaseHref = (pathBase, q) ->
  _.isString(q) && q.indexOf(pathBase) >= 0

class BaseCollectionLoader
  constructor: (@connection) ->

  find: (q) ->
    if _.isNumber q
      @findByIndex(q)
    else if isBaseHref(@pathBase, q)
      @findByHref(q)
    else
      @findById(q)

  findByIndex: (index) ->
    path = UriUtils.buildPath(@pathBase,
      limit: 1
      offset: index
    )
    @findByHref path

  findById: (id) ->
    @findByHref("#{@pathBase}/#{id}")

  findByHref: (href) ->
    @connection.get(href).then (response) =>
      r = new BalancedApiResponse(response)
      r.setConnection @connection
      items = r.getItems()[@itemsResponseKey]
      if items && items.length > 0
        items[0]

  buildFilterQueryString: (attributes) ->
    queryStringBuilder = new QueryStringBuilder()
    queryStringBuilder.addValues(attributes)
    queryStringBuilder.getQueryStringAttributes()

  transformFilterAttributes: (attributes) ->
    attributes || {}

  filter: (attributes) ->
    path = UriUtils.buildPath(@pathBase, @transformFilterAttributes(attributes))
    @connection.get(path).then (response) =>
      r = new BalancedApiResponse(response)
      r.setConnection @connection
      r

  create: (attributes) ->
    @connection.post(@pathBase, attributes)

  validate: (attr) ->
    @validatorClass.validate attr

`export default BaseCollectionLoader`
