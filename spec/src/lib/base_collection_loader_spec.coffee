`import BaseCollectionLoader from 'balanced/lib/base_collection_loader'`

describe 'BaseCollectionLoader', ->
  describe '::define', ->
    it "creates ajax methods that delegate to the connection class", ->
      connection =
        get: jasmine.createSpy()
      loader = BaseCollectionLoader.define(connection, "/cool/path")
      loader.get("/cool/path2")
      expect(connection.get).toHaveBeenCalledWith "/cool/path2"

  describe "#start", ->
    it "calls get with the right path", ->
      connection =
        get: jasmine.createSpy()
      loader = BaseCollectionLoader.define(connection, "/cool/path")
      loader.start()
      expect(connection.get).toHaveBeenCalledWith "/cool/path"

