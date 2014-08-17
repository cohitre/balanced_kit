`import BaseCollectionLoader from "balanced/lib/base_collection_loader"`

class CustomerCollectionLoader extends BaseCollectionLoader
  handleResponse: (response) ->
    response.getItems().customers

  validate: (attr) ->

  create: (attributes) ->
    @post(@path, attributes)

`export default CustomerCollectionLoader`
