App.ApplicationController = Ember.Controller.extend({
  purchases: [],
  actions: {
    addCustomer: function(name, total) {
      var customer = Ember.Object.create({
        customerName: name,
        total: parseFloat(total),
        createdAt: new Date()
      });

      this.get("purchases").pushObject(customer);
    },
  }
});

var Table = BalancedKit.Views.Table;

App.SampleTableFooterView = Table.TableRowView.extend({
  attributeBindings: ["colspan"],
  colspan: 3,
  childViews: Ember.computed
//  childViews: Ember.computed(func)
});

App.SampleTableView = Table.BaseView.extend(Table.FullTableMixin, {
  theadRowView: Ember.computed(function() {
    var cells = ["Date", "Customer name", "Total"];
    return Table.TableRowView.createForCells(cells, {
      tagName: "th"
    });
  }),

  purchasesLength: Ember.computed.oneWay("purchases.length"),

  customersMessage: Ember.computed("purchasesLength", function() {
    return "Number of items is %@".fmt(this.get("purchasesLength"));
  }),

  tfootRowView: Ember.computed("customersMessage", function() {
    var cells = [
      this.get("customersMessage")
    ];
    console.log(this.get("customersMessage"), 100)
    return Table.TableRowView.createForCells(cells, {
      colspan: 3,
      tagName: "th"
    });
  })
});
