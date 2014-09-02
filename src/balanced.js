import BalancedApiService from "./services/balanced_api_service";
import Utils from "./lib/utils";
import Views from "./views/index";

var BalancedKit = {
  utils: Utils,
  service: function(secret) {
    return BalancedApiService.forKey(secret);
  },
  Views: Views
};

export default BalancedKit;
this.BalancedKit = BalancedKit
