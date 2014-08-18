import BalancedApiService from "balanced/services/balanced_api_service";
module Views from "balanced/views/index";

var BalancedKit = {
  service: function(secret) {
    return BalancedApiService.forKey(secret);
  },
  Views: Views,
};

export default BalancedKit;
