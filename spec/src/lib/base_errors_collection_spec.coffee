`import BaseErrorsCollection from 'balanced/lib/base_errors_collection'`

describe 'BaseErrorsCollection', ->
  describe "#addError", ->
    it "should label push an object into the collection", ->
      collection = new BaseErrorsCollection
      collection.addError("name", "name should be present")
      expect(collection.errors).toEqual [
        field: "name"
        message: "name should be present"
      ]

  describe "#getErrorMessages", ->
    it "should return all the messages", ->
      collection = new BaseErrorsCollection
      collection.addError("name", "name should be present")
      expect(collection.getErrorMessages()).toEqual ["name should be present"]
