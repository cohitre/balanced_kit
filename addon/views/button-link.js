import Ember from "ember";
import Template from "../templates/button-link";

var ButtonLinkView = Ember.View.extend({
  template: Template,
  tagName: "a",
  classNames: ["btn"],
});

export default ButtonLinkView;
