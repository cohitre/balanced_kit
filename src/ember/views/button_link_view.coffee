ButtonLinkView = Ember.View.extend
  tagName: "a"
  classNames: ["btn"]
  template: Ember.Handlebars.compile("{{view.text}}")

`export default ButtonLinkView`
