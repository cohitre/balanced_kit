BalancedKit = require("balanced/balanced").default

describe 'BalancedKit', ->
  it "should have the right modules", ->
    expect(BalancedKit.utils).toBeDefined()

  describe "#service", ->
    it "should return a BalancedApiService", ->
      expect(BalancedKit.service("some-secret").connection).toBeDefined()

  describe "#lookup", ->
    it "should delegate to the container and instantiate the object", ->
      dummyObject =
        create: jasmine.createSpy("create spy")

      spyOn(BalancedKit.container, "lookupFactory")
        .and.returnValue dummyObject

      BalancedKit.lookup("TestString",
        name: "Dr. Test"
      )

      expect(BalancedKit.container.lookupFactory).toHaveBeenCalledWith("TestString")
      expect(dummyObject.create).toHaveBeenCalledWith(
        name: "Dr. Test"
      )

