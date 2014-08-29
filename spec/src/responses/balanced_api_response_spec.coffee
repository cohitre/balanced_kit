`import BalancedApiResponse from "balanced/responses/balanced_api_response"`

EXAMPLE_RESPONSE =
  meta:
    next: "/next"
    previous: "/prev"
    first: "/first"
    last: "/last"

itShouldDelegateToHasMeta = (methodName, keyName) ->
  it "delegates to hasMeta", ->
    response = new BalancedApiResponse()
    spyOn(response, "hasMeta")
    response[methodName]()
    expect(response.hasMeta).toHaveBeenCalledWith keyName

itShouldDelegateToConnectionGet = (methodName, uriKey) ->
  uriKey ||= methodName

  it "delegates to connection.get", ->
    connection =
      get: ->

    meta = {}
    meta[uriKey] = "/some/path"
    response = new BalancedApiResponse(meta: meta)
    response.setConnection(connection)
    spyOn(connection, "get").and.returnValue(
      then: ->
    )
    response[methodName]()
    expect(connection.get).toHaveBeenCalledWith "/some/path"


describe "BalancedApiResponse", ->
  describe "#hasMeta", ->
    describe "(no arguments)", ->
      it "is false when no meta is present", ->
        response = new BalancedApiResponse({})
        expect(response.hasMeta()).toBe false

      it "is true when meta is present", ->
        response = new BalancedApiResponse(EXAMPLE_RESPONSE)
        expect(response.hasMeta()).toBe true

    describe "(property name)", ->
      it "is false when there's no meta", ->
        response = new BalancedApiResponse({})
        expect(response.hasMeta("next")).toBe false

      it "is false when it is not present", ->
        response = new BalancedApiResponse({
          meta: {}
        })
        expect(response.hasMeta("next")).toBe false

      it "is true when the value is present", ->
        response = new BalancedApiResponse(EXAMPLE_RESPONSE)
        expect(response.hasMeta("next")).toBe true

  describe "#getMeta", ->
    it "should get the meta value", ->
      response = new BalancedApiResponse(
        meta: {
          "last": "/marketplaces?limit=10&offset=0",
          "first": "/marketplaces?limit=10&offset=0"
        }
      )

      expect(response.getMeta()).toEqual(
        "last": "/marketplaces?limit=10&offset=0",
        "first": "/marketplaces?limit=10&offset=0"
      )

  describe "#hasNext", ->
    itShouldDelegateToHasMeta("hasNext", "next")
  describe "#hasPrev", ->
    itShouldDelegateToHasMeta("hasPrev", "previous")

  describe "#next", ->
    itShouldDelegateToConnectionGet("next")
  describe "#prev", ->
    itShouldDelegateToConnectionGet("prev", "previous")
  describe "#first", ->
    itShouldDelegateToConnectionGet("first")
  describe "#last", ->
    itShouldDelegateToConnectionGet("last")

  describe "#getLinks", ->
    it "should get the links value", ->
      response = new BalancedApiResponse(
        links:
          "marketplaces.debits": "/debits"
          "marketplaces.reversals": "/reversals"
      )

      expect(response.getLinks()).toEqual(
        "marketplaces.debits": "/debits"
        "marketplaces.reversals": "/reversals"
      )

  describe "#getItems", ->
    it "returns all the values but meta and link", ->
      response = new BalancedApiResponse(
        transactions: "Some Transactions"
        debits: "Some debits"
        credits: "Some credits"
        meta:
          name: "Jim Meta"
        links:
          "marketplaces.debits": "/debits"
          "marketplaces.reversals": "/reversals"
      )

      expect(response.getItems()).toEqual(
        transactions: "Some Transactions"
        debits: "Some debits"
        credits: "Some credits"
      )
