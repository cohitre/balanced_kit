`import ApiResultsTableView from 'balanced-kit/views/tables/api-results-table';`

describe 'ApiResultsTableView', ->
  beforeEach ->
    jasmine.container.create()

  afterEach ->
    jasmine.container.clean()

  describe "#render", ->
    subject = (extensions) ->
      ApiResultsTableView.extend(
        container: new Ember.Container
        headerRowCellClasses: [
          Ember.View.extend(tagName: "th", classNames: ["column1"])
        ]
        bodyRowCellClasses: [
          Ember.View.extend(tagName: "td", classNames: ["cell1"])
        ]
        content: [90, 39, 218]
      ).create(extensions)

    describe "tbody", ->
      it "renders one row per item", ->
        container = jasmine.container
        view = subject()
        container.append view
        expect(container.find("td.cell1").length).toBe 3

      it "renders the no results message", ->
        container = jasmine.container
        view = subject(content: [])
        container.append view
        expect(container.text("tbody td.cell-message")).toEqual "No results"

      it "renders the loading message", ->
        container = jasmine.container
        view = subject(
          isLoading: true
          content: []
        )
        container.append view
        expect(container.text("tbody td.cell-message")).toEqual "Loading..."


    describe "tfoot", ->
      it "renders the isLoading message", ->
        container = jasmine.container
        view = subject(
          isLoading: true
          hasNext: true
          columnsCount: 3
        )
        container.append view
        expect(container.text("tfoot tr td.cell-message")).toBe "Loading"

      it "renders the button when there are more items", ->
        container = jasmine.container
        view = subject(
          isLoading: false
          hasNext: true
        )
        container.append view
        expect(container.text("tfoot tr td a.btn")).toBe "Load more"

    it "renders without error", ->
      container = jasmine.container
      view = subject()
      container.append view
      expect(container.find("th.column1").length).toBe 1

  describe "#columnsCount", ->
    it "delegates to bodyRowCellClasses", ->
      view = ApiResultsTableView.create(
        bodyRowCellClasses: Ember.Object.create({
          length: 100
        })
      )
      expect(view.get("columnsCount")).toBe 100

  describe "#content", ->
    it "delegates to model.results", ->
      view = ApiResultsTableView.create(
        model: Ember.Object.create(
          results: "cool value"
        )
      )
      expect(view.get("content")).toBe("cool value")


  describe "#isLoading", ->
    it "delegates to model", ->
      view = ApiResultsTableView.create(
        model: Ember.Object.create(
          isLoading: true
        )
      )
      expect(view.get("isLoading")).toBe(true)

  describe "#hasNext", ->
    it "delegates to model", ->
      view = ApiResultsTableView.create(
        model: Ember.Object.create(
          hasNext: true
        )
      )
      expect(view.get("hasNext")).toBe(true)
