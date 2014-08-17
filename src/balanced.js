import BalancedApiService from "balanced/services/balanced_api_service";
module Views from "balanced/views/index";
module Models from "balanced/models/index";

var BalancedKit = {
  service: function(secret) {
    return BalancedApiService.forKey(secret);
  },
  Views: Views,
  Models: Models,
  getMarketplace: function(secretKey) {
    return Models.Marketplace.findByApiKey(secretKey);
  }
};

export default BalancedKit;
