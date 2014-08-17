`import BalancedApiResponse from "balanced/responses/balanced_api_response"`

describe "BalancedApiResponse", ->
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
