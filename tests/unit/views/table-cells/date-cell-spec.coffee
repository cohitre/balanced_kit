`import DateCellView from 'balanced-kit/views/table-cells/date-cell';`

describe "DateCellView", ->
  SAMPLE_DATE_STRING = "Mon, 25 Dec 1995 13:33:00 GMT"
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  subject = ->
    new DateCellView(
      container: new Ember.Container()
    )

  describe "#dateString", ->
    it "should have the correct format", ->
      view = subject()
      Ember.run ->
        view.set "date", new Date(SAMPLE_DATE_STRING)
      expect(view.get("dateString")).toEqual "Dec 25, 1995"

  describe "#timeString", ->
    it "should have the correct format", ->
      view = subject()
      Ember.run ->
        view.set "date", new Date(SAMPLE_DATE_STRING)

      expect(view.get("timeString")).toMatch /\d?\d:33 (a|p)m/

  describe "#render", ->
    it "should have the correct markup", ->
      container = jasmine.container

      view = subject()

      Ember.run ->
        view.set "date", new Date(SAMPLE_DATE_STRING)
        view.appendTo(container.get())

      expect(container.text()).toMatch /Dec 25, 1995 \d?\d:33 (a|p)m/
      expect(container.text(".text-understate")).toMatch /\d?\d:33 (a|p)m/
