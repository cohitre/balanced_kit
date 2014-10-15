import Ember from 'ember';

// TODO: load based on params
Ember.keys(requirejs.entries).forEach(function(entry) {
  if ((/\-spec/).test(entry)) {
    require(entry, null, null, true);
  }
});
