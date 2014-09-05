_.each(BalancedKit.container.registry, function(value, key) {
  App.register(key.replace(/\//g, "."), value);
});

window.Application = App;

App.ApplicationController = Ember.Controller.extend({
  service: Ember.computed(function () {
    return BalancedKit.service(this.get("secret"));
  }).property("secret"),

  secret: null,

  isLoading: false,

  marketplaceApiKeysColumns: ["created_at", "id"],

  apiKeysTable: Ember.computed(function() {
    return BalancedKit.ui.table(function(table) {
      table.column(function(col) {
        col.header("text", "Date");
        col.cell("date", function(apiKey) {
          return {
            date: apiKey.created_at
          };
        });
      });

      table.column(function(col) {
        col.header("text", "Name");
        col.cell("text", function(apiKey) {
          return {
            text: apiKey.name,
            placeholderText: "none"
          };
        });
      });
    }).toEmber();
  }),

  actions: {
    open: function (secret) {
      var self = this;
      var service = this.get("service");

      this.setProperties({
        isLoading: true,
        marketplace: null
      });

      if (service) {
        service.marketplaces.find(0)
          .then(function (marketplace) {
            self.set("marketplace", marketplace);
          })
          .finally(function () {
            self.set("isLoading", false);
          });
        service.apiKeys.filter()
          .then(function(response) {
            var apiKeys = response.getItems().api_keys;
            self.set("marketplaceApiKeys", apiKeys);
          });
      }

    }
  }
});
