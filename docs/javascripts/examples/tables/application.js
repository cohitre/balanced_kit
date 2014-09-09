App.ApplicationController = Ember.Controller.extend({
  customersTable: Ember.computed(function() {

    return BalancedKit.ui.table(function(t) {
      t.footer(function(footer, contents) {
        footer.template("button_link");
        footer.text("Hello");
        footer.prop({
          content: contents
        });
        footer.prop("click", function() {
          this.get("controller").send("createCustomer", "Cool Customer");
        });
      });

      t.column(function(col) {
        col.header(function(h) {
          h
            .template("text")
            .addClass("span2")
            .text("Member since");
        });

        col.cell(function(cell, customer) {
          cell.template("date");
          cell.prop("date", customer.created_at);
        });
      });

      t.column(function(col) {
        col.header(function(h) {
          h
            .template("text")
            .text("Encouraging words");
        });
        col.cell(function(c) {
          c
            .template("text")
            .text("Good job!");
        });
      });

      t.column(function(col) {
        col.header(function(h) {
          h
            .template("text")
            .text("Name");
        });
        col.cell(function(c, customer) {
          c.template("text");
          c.prop({
            text: customer.name,
            placeholderText: "No name"
          });
        });
      });
    }).toEmber();
  }),

  customers: Ember.A([{
    created_at: new Date("Mon, 25 Dec 1995 13:30:00 GMT"),
    name: "Laurie George"
  }]),

  actions: {
    createCustomer: function (name) {
      this.get("customers").pushObject({
        created_at: new Date(),
        name: name,
      });
      this.set("name", "");
    }
  }
});
