`import CustomerCollectionLoader from 'balanced/collection_loaders/customer_collection_loader'`

SAMPLE_RESPONSE =
  customers: "customers list"
  meta:
    next: "/customers/next"
  links: null

describe 'CustomerCollectionLoader', ->
  describe "#validate", ->
    it "should delegate to the CustomerForm", ->

  describe "#create",->
    it "should validate the fields", ->

    it "should pass the data to the connection", ->
      connection = {
        post: ->
      }
      spyOn(connection, "post").and.stub()

      loader = new CustomerCollectionLoader(connection, "/customers")
      loader.create(
        name: "Lou Customer"
      )

      expect(connection.post).toHaveBeenCalledWith("/customers", {
        name: "Lou Customer"
      })

  describe "#start", ->
    it "should transform the response", ->
