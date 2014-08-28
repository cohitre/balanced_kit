`import CustomerCollectionLoader from 'balanced/collection_loaders/customer_collection_loader'`

SAMPLE_RESPONSE =
  customers: "customers list"
  meta:
    next: "/customers/next"
  links: null

describe 'CustomerCollectionLoader', ->
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
