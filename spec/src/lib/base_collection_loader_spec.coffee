`import BaseCollectionLoader from 'balanced/lib/base_collection_loader'`

describe 'BaseCollectionLoader', ->
  describe "#start", ->
    it "calls get with the right path", ->
      connection =
        get: jasmine.createSpy()
      loader = BaseCollectionLoader.define(connection, "/cool/path")
      loader.start()
      expect(connection.get).toHaveBeenCalledWith "/cool/path"
