`import BaseConnection from 'balanced/lib/base_connection'`

describe 'BaseConnection', ->
  generateSubject = () ->
    subject = new BaseConnection
    subject.host = "http://api.example.org"
    subject

  beforeEach ->
    spyOn(BaseConnection, "ajax").and.returnValue()

  describe "#settings", ->
    it "should return the settings unchanged", ->
      subject = new BaseConnection
      object =
        value: 100
        animal: "gorilla"
      expect(subject.settings(object)).toBe object

  describe "#del", ->
    it "should delegate to ajax", ->
      subject = generateSubject()
      subject.del("/transaction")
      expect(BaseConnection.ajax).toHaveBeenCalledWith("http://api.example.org/transaction", {
        type: "DELETE"
      })

  describe "#get", ->
    it "should delegate to ajax", ->
      subject = generateSubject()
      subject.get("/transaction")
      expect(BaseConnection.ajax).toHaveBeenCalledWith("http://api.example.org/transaction", {
        type: "GET"
      })

  describe "#post", ->
    it "should delegate to ajax", ->
      subject = generateSubject()
      subject.post("/transaction", {
        name: "Willy"
      })
      expect(BaseConnection.ajax).toHaveBeenCalledWith("http://api.example.org/transaction", {
        type: "POST"
        data:
          name: "Willy"
      })

  describe "#put", ->
    it "should delegate to ajax", ->
      subject = generateSubject()
      subject.put("/transaction", {
        name: "Willy"
      })
      expect(BaseConnection.ajax).toHaveBeenCalledWith("http://api.example.org/transaction", {
        type: "PUT"
        data:
          name: "Willy"
      })

  describe "#ajax", ->
    it "should delegate to the class function", ->
      subject = generateSubject()
      subject.ajax("/transaction", {
        header: "No Thanks"
      })
      expect(BaseConnection.ajax).toHaveBeenCalledWith("http://api.example.org/transaction", {
        header: "No Thanks"
      })
