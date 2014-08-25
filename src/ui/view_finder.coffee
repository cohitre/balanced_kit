`import DescriptionListView from "./views/description_list_view"`
`import StringView from "./views/string_view"`
`import CollectionView from "./views/collection_view"`

VIEW_MAPPINGS = {}

registerMapping = (klass, names...) ->
  for name in names
    VIEW_MAPPINGS[name] = klass

registerMapping(StringView, "string")
registerMapping(CollectionView, "collection")
registerMapping(DescriptionListView, "descriptionList", "description-list")

ViewFinder =
  find: (viewName) ->
    VIEW_MAPPINGS[viewName]

`export default ViewFinder`
