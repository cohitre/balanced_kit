setter = (name) ->
  (value) ->
    @attr name, value
    @


isResourceId = (object) ->
isResourceHref = (object) ->
isQueryStringObject = (object) ->

class SearchQuery
  @execute = (connection, klass, path, object) ->
    if (isResourceId(object))
      connection.get("#{path}/#{object}")
    else if (isResourceHref(object))
      connection.get(object)
    else
      search = new @(connection, path)
      if (object?)
        search.attr(object)
      search

  @addQueryStringSerializer = (keys..., callback) ->

  @addQueryStringSerializer "before", (beforeDate) ->
    if beforeDate isa Number
      new Date().setTime()

  @addQueryStringSerializer "sortBy", "sortDirection", (sortBy, sortDirection) ->
    if !sortBy?
      sortBy = "created_at"

    if sortDirection == "ascending" || sortDirection == "asc"
      sortDirection = "asc"
    else
      sortDirection = "desc"

    sort: [sortBy,sortDirection].join(",")

  constructor: (@connection, @path) ->
    queryStringAttributes = {}

  before: setter("before")
  after: setter("after")
  limit: setter("limit")
  sortBy: setter("sortBy")
  sortDirection: setter("sortDirection")

  attr: (name, value) ->
    if (arguments.length == 2)
      @queryStringAttributes[name] = value
    else if (arguments.length == 1)
      _.extend(@queryStringAttributes, name)
    @

  then: (callback) ->
    @connection
      .get(@path)
      .then callback

`export default SearchQuery`
