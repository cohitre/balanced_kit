`import SearchQuery from "./search_query"`

getter = (attrName) ->
  ->
    @get(attrName)

dateGetter = (attrName) ->
  ->
    dateStr = @get(attrName)
    new Date(dateStr)

class BaseModel
  constructor: (@connection, @attributes, @links, @meta) ->

  get: (value) ->
    @attributes[value]

  # Common fields
  getId: getter("id")
  getHref: getter("href")
  getCreatedAt: dateGetter("created_at")
  getUpdatedAt: dateGetter("updated_at")

  link: (klass, path, searchObject) ->
    SearchQuery.execute(@connection, klass, path, searchObject)

`export { BaseModel };`
`export default BaseModel;`
