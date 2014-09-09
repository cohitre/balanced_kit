TextView = require("balanced/ember/views/text_view").default

ButtonLinkView = TextView.extend
  tagName: "a"
  classNames: [":btn"]

`export default ButtonLinkView`
