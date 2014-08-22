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

      loader = new CustomerCollectionLoader(connection)
      loader.create(
        name: "Lou Customer"
      )

      expect(connection.post).toHaveBeenCalledWith("/customers", {
        name: "Lou Customer"
      })

  describe "#transformFilterAttributes", ->
    it "should serialize 4 keys", ->
      loader = new CustomerCollectionLoader()
      filters =
        limit: 100
        sort: "created_at"
        startTime: new Date("2010-08-02T01:00:00.000Z")
        endTime: new Date("2010-08-02T02:00:00.000Z")
      expect(loader.transformFilterAttributes(filters)).toEqual(
        limit: 100
        sort: 'created_at'
        "created_at[>]": '2010-08-02T01:00:00.000Z'
        "created_at[<]": '2010-08-02T02:00:00.000Z'
      )
