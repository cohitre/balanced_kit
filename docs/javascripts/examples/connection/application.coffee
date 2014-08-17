App.ApplicationController = Ember.Controller.extend
  service: Ember.computed "secret", ->
    secret = this.get "secret"
    service = BalancedKit.service secret

  secret: undefined

  isLoading: false
  marketplace: null
  customers: Ember.A()
  customersResponse: null

  isMoreCustomers: Ember.computed "customers", "customersResponse", ->
    customers = this.get "customers"
    customersResponse = this.get("customersResponse")
    if customersResponse
      customersResponse.hasNext()
    else
      customers.get("length") == 0

  actions:
    open: (secret) ->
      service = this.get("service")
      this.set("isLoading", true)

      service.getMarketplaces()
        .then (response) =>
          this.set("marketplace", response.getItems().marketplaces[0])
        .always =>
          this.set("isLoading", false)

    loadCustomers: ->
      service = this.get("service")

      if this.get("customersResponse")
        this.get("customersResponse").next()
          .then (response) =>
            this.set("customersResponse", response)
            this.get("customers").pushObjects(response.getItems().customers)
      else
        service
          .getCustomers()
          .then (response) =>
            this.set("customersResponse", response)
            if response
              this.get("customers").pushObjects(response.getItems().customers)
