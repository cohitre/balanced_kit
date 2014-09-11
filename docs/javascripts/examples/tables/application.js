App.ApplicationController = Ember.Controller.extend({
  tableView: Ember.computed(function() {
    return BalancedKit.ui.table(function(table) {
      table.head.row(function(builder) {
        builder.textHeader("Birthday");
        builder.textHeader("Name");
      });

      table.body.row(function(builder) {
        builder.dateCell(function(rowView) {
          return {
            model: rowView.get("model"),
            dateBinding: "model.birthday"
          };
        });
        builder.textCell(function(rowView) {
          return {
            model: rowView.get("model"),
            textBinding: "model.name"
          };
        });
      });

      table.foot.button("Load more", function() {
        var collection = this.get("content");
        this.get("controller").send("loadMore", collection);
      });
    }).toEmberClass();
  }).property(),

  wrestlers: Ember.A([{
    name: "Abdullah The Butcher",
    birthday: new Date("11 Jan 1941 1:00:00 GMT")
  }, {
    name: "Batista",
    birthday: new Date("18 Jan 1969 11:00:00 GMT"),
  }]),

  actions: {
    loadMore: function(collection) {
      console.log(collection);
    },
  }
});
