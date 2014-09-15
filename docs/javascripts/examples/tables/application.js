App.ApplicationController = Ember.Controller.extend({
  tableView: Ember.computed(function() {
    return BalancedKit.ui.table("simple", function(table) {
      table.head.text("Name");

      table.head.text("Birthday", {
        classNames: "col-sm-3"
      });

      table.body.cell("text", {
        text: Ember.computed.oneWay("model.name")
      });

      table.body.cell("date", {
        date: Ember.computed.oneWay("model.birthday")
      });
    });
  }).property(),

  contacts: Ember.A([{
    name: "Abdullah The Butcher",
    birthday: new Date("11 Jan 1941 1:00:00 GMT")
  }, {
    name: "Batista",
    birthday: new Date("18 Jan 1969 11:00:00 GMT"),
  }]),

  actions: {
    createContact: function(name) {
      var date = new Date();
      date.setTime(Math.random() * 1000000000000);
      this.get("contacts").pushObject({
        name: name,
        birthday: date
      });
      this.set("name", "");
    },
  }
});
