`import BaseConnection from 'balanced/lib/base_connection'`

describe 'BaseConnection', ->
  generateSubject = ->
    subject = new BaseConnection
    subject.host = "http://api.example.org"
    subject

  beforeEach ->
      spyOn(jQuery, "ajax").and.stub()

  describe "#settings", ->
    it "should return the settings unchanged", ->
      subject = new BaseConnection
      object =
        value: 100
        animal: "gorilla"
      expect(subject.settings(object)).toBe object

  describe "#del", ->
    it "should delegate to ajax", ->
  describe "#get", ->
    it "should delegate to ajax", ->

  describe "#post", ->
    it "should delegate to ajax", ->

  describe "#put", ->
    it "should delegate to ajax", ->
