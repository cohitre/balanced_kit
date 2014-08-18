`import CustomerCollectionLoader from 'balanced/collection_loaders/customer_collection_loader'`

describe 'CustomerCollectionLoader', ->
  describe "#handleResponse", ->
    it "should return the customers", ->
      subject = new CustomerCollectionLoader()
      expect(subject.handleResponse(
        getItems: ->
          customers: "customers list"
      )).toBe("customers list")

  describe "#validate", ->

