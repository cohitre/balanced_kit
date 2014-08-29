el = (args...) ->
  BalancedKit.ui.element(args...)

App.ApplicationView = Ember.View.extend
  sidePanel: Ember.computed "controller.marketplace", ->
    marketplace = @get("controller.marketplace")

    el("div", [
      el("h1", @get("controller.marketplace.name")),
      el("hr"),
      BalancedKit.ui.build("descriptionList", {}, marketplace)
    ])

App.ApplicationController = Ember.Controller.extend
  service: Ember.computed "secret", ->
    BalancedKit.service this.get("secret")

  secret: null
  isLoading: false
  marketplace: null

  actions:
    open: (secret) ->
      @set("isLoading", true)
      @get("service").marketplaces.find(0)
        .then (marketplace) =>
          @set("marketplace", marketplace)
        .finally =>
          @set("isLoading", false)
