`import ViewFinder from "./view_finder"`
`import BaseView from "./views/base_view"`

UiModule = (viewName, options) ->
  ViewBuilder.forName(viewName, options)

UiModule.element = (definition, children) ->
  view = new BaseView
  view.el(definition, children)

UiModule.el = UiModule.element

UiModule.build = (viewName, elementDefinition, contents) ->
  viewClass = ViewFinder.find(viewName)
  view = new viewClass(contents)
  view.setElementDefinition elementDefinition
  view.toEmber()

`export default UiModule`
