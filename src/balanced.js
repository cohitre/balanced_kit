var BalancedApiService = require("balanced/services/balanced_api_service").default;
var UiModule = require("balanced/ui/index").default;

var BalancedKit = {
  service: function(secret) {
    return BalancedApiService.forKey(secret);
  },
  ui: UiModule,
  container: new Ember.Container(),
  register: function(name, klass) {
    this.container.register(name, klass);
    return this;
  },
  lookup: function(name, attributes) {
    var klass = this.container.lookupFactory(name)
    return klass.create(attributes);
  },
};

var registerView = function(name) {
  var ViewClass = require("balanced/ember/views/" + name + "_view")["default"];
  BalancedKit.register("view:balanced_kit/" + name, ViewClass);
};

registerView("description_list");
registerView("table");
registerView("text");
registerView("table_cells/text_header_cell");
registerView("table_cells/empty_header_cell");
registerView("table_cells/heavy_light_cell");
registerView("table_cells/text_cell");
registerView("table_cells/date_cell");
registerView("table_cells/empty_cell");

export default BalancedKit;
