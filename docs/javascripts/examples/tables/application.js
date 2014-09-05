App.ApplicationController = Ember.Controller.extend({
  customersTable: Ember.computed(function() {

    return BalancedKit.ui.table(function(t) {
      t.column(function(col) {
        col.header("text", "Member since");
        col.cell("date", function(customer) {
          return {
            date: customer.created_at
          };
        });
      });

      t.column(function(col) {
        col
          .header("text", "Encouraging words")
          .cell("text", "Good job!");
      });

      t.column(function(col) {
        col
          .header("text", "Name")
          .cell("text", function(customer) {
            return {
              text: customer.name,
              placeholderText: "No name"
            };
          });
      });
    }).toEmber();
  }),

  customers: Ember.A([{
    created_at: new Date("Mon, 25 Dec 1995 13:30:00 GMT"),
    name: "Laurie George",
    email: "laurie.george62@example.com",
    phone: "(555)-555-5555"
  }]),

  actions: {
    createCustomer: function (name, email) {
      this.get("customers").pushObject({
        created_at: new Date(),
        name: name,
        email: email
      });
      this.set("name", "");
      this.set("email", "");
    }
  }
});
