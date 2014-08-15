module Views from "balanced/views/index";
module Models from "balanced/models/index";
import BalancedApiConnection from "balanced/lib/connections/balanced_api_connection";

var BalancedKit = {
  Views: Views,
  Models: Models,
  getMarketplace: function(secretKey) {
    return Models.Marketplace.findByApiKey(secretKey);
  }
};

export default BalancedKit;
