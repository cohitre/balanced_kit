`import BaseCollectionLoader from "balanced/lib/base_collection_loader"`

class CustomerCollectionLoader extends BaseCollectionLoader
  handleResponse: (response) ->
    response.getItems().customers

  validate: (attr) ->

  create: (attributes) ->
    @post(@path, attributes)

  start: ->
    super()
      .then (response) =>
        @handleResponse(response)

`export default CustomerCollectionLoader`
