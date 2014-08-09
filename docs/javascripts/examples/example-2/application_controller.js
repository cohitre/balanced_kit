App.ApplicationController = Ember.ArrayController.extend({
  actions: {
    append: function(item) {
      this.pushObject(item);
    }
  }
});
