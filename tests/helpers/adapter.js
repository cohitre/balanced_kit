/**
  https://github.com/spra85/jasmine-ember-testing/blob/master/lib/adapter.js
  @class JasmineAdapter
  @namespace Ember.Test
  v 0.1
*/
var JasmineAdapter = Ember.Test.Adapter.extend({
  asyncRunning: false,

  asyncStart: function() {
    Ember.Test.adapter.asyncRunning = true;
    waitsFor(Ember.Test.adapter.asyncComplete);
  },

  asyncComplete: function() {
    return !Ember.Test.adapter.asyncRunning;
  },

  asyncEnd: function() {
    Ember.Test.adapter.asyncRunning = false;
  },

  exception: function(error) {
    expect(Ember.inspect(error)).toBeFalsy();
  }
});

export default JasmineAdapter;
