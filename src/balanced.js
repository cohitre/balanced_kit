import BalancedApiService from "balanced/services/balanced_api_service";
import Utils from "balanced/lib/utils";

var BalancedKit = {
  lib: {
    RSVP: RSVP,
    $: jQuery,
    _: _
  },
  utils: Utils,
  service: function(secret) {
    return BalancedApiService.forKey(secret);
  },
};

export default BalancedKit;
