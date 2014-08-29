`import BaseCollectionLoader from 'balanced/lib/base_collection_loader'`

describe 'BaseCollectionLoader', ->
  getConnection = jasmine.getConnection

  describe "#find", ->
    expectHref = (value, href) ->
      connection = getConnection()
      loader = new BaseCollectionLoader(connection)
      loader.pathBase = "/transactions"
      loader.find(value)
      expect(connection.get).toHaveBeenCalledWith(href)

    it "delegates to findByIndex when it's a number", ->
      expectHref(1, "/transactions?limit=1&offset=1")

    it "delegates to findByHref when the base is present", ->
      expectHref("/transactions/TXxxxxxx", "/transactions/TXxxxxxx")

    it "delegates to findById when it's an id", ->
      expectHref("TXxxxxxx", "/transactions/TXxxxxxx")

  describe "#findByIndex", ->
    it "builds a uri with an offset and limit", ->
      connection = getConnection()
      loader = new BaseCollectionLoader(connection)
      loader.pathBase = "/transactions"
      loader.findByIndex(0)
      expect(connection.get).toHaveBeenCalledWith('/transactions?limit=1&offset=0')

  describe "#findById", ->
    it "builds a resource uri", ->
      connection = getConnection()
      loader = new BaseCollectionLoader(connection)
      loader.pathBase = "/transactions"
      loader.findById("TRxxxxxxxxxxxx")
      expect(connection.get).toHaveBeenCalledWith('/transactions/TRxxxxxxxxxxxx')

  describe "#findByHref", ->
    it "delegates to the connection", ->
      connection = getConnection()
      loader = new BaseCollectionLoader(connection)
      loader.findByHref("/transactions/TRxxxxxxxxxxxx")
      expect(connection.get).toHaveBeenCalledWith('/transactions/TRxxxxxxxxxxxx')

  describe "#buildFilterQueryString", ->
    it "builds a query string", ->
      loader = new BaseCollectionLoader
      result = loader.buildFilterQueryString(
        name: "dr. test",
        ageRange: [10, 100]
      )

      expect(result).toEqual(
        name: "dr. test",
        "ageRange[in]": "10,100"
      )

  describe "#transformFilterAttributes", ->
    it "passes the attributes through", ->
      loader = new BaseCollectionLoader
      expect(loader.transformFilterAttributes(name: "dr. attr")).toEqual(
        name: "dr. attr"
      )

  describe "#filter", ->
    it "should fetch a url with query string", ->
      connection = getConnection()
      loader = new BaseCollectionLoader(connection)
      loader.pathBase = "/transactions"
      loader.filter(
        name: "jim"
      )
      expect(connection.get).toHaveBeenCalledWith("/transactions?name=jim")

  describe "#create", ->
    it "posts the data", ->
      connection = getConnection()
      loader = new BaseCollectionLoader(connection)
      loader.pathBase = "/transactions"
      loader.create(
        amount: 1000
      )
      expect(connection.post).toHaveBeenCalledWith "/transactions", {
        amount: 1000
      }

  describe "#validate", ->
    it "delegates to the validator class", ->
      validator =
        validate: ->

      spyOn(validator, "validate")
      subject = new BaseCollectionLoader
      subject.validatorClass = validator

      subject.validate(
        name: "Test Me"
      )
      expect(validator.validate).toHaveBeenCalledWith(
        name: "Test Me"
      )

