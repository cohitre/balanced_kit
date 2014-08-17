import template from "balanced/templates/details/layout";

var BaseView = Ember.View.extend({
  layout: template,
  tagName: "aside",
  title: undefined,
});

export {BaseView};
export default BaseView;
