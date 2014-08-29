App.ApplicationController = Ember.Controller.extend({
  service: Ember.computed(function () {
    return BalancedKit.service(this.get("secret"));
  }).property("secret"),

  secret: null,
  isLoading: false,
  marketplace: null,

  actions: {
    open: function (secret) {
      var self = this;
      this.setProperties({
        isLoading: true,
        marketplace: null
      });
      this.get("service").marketplaces.find(0)
        .then(function (marketplace) {
          self.set("marketplace", marketplace);
        })
        .finally(function () {
          self.set("isLoading", false);
        });
    }
  }
});
