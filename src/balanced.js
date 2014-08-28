import BalancedApiService from "./services/balanced_api_service";
import Utils from "./lib/utils";
import UiModule from "./ui/ui_module";
import Views from "./views/index";

var BalancedKit = {
  utils: Utils,
  service: function(secret) {
    return BalancedApiService.forKey(secret);
  },
  ui: UiModule,
  Views: Views
};

export default BalancedKit;
