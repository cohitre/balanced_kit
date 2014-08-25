`import BaseView from "./base_view"`

class DescriptionListView extends BaseView
  children: ->
    results = []
    label = (label, value) =>
      results.push @el("dt", label)
      results.push @el("dd", value)

    label("Created at", (new Date(@value.created_at)).toString())
    label("Marketplace id", @value.id)
    label("Name", @value.name)
    label("Support email", @value.support_email_address)
    label("Domain URL", @value.domain_url)
    label("Support phone number", @value.support_phone_number)

    results

  toEmber: ->
    definition = _.extend({
      tagName: "dl"
      class: "dl-horizontal"
    }, @elementDefinition)
    @el(definition, @children())

`export default DescriptionListView`
