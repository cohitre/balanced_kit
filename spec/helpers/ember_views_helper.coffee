TESTING_CONTAINER_ID = "ember-testing-container"

jasmine.container =
  create: ->
    testElement = $("<div id='#{TESTING_CONTAINER_ID}'><div id='ember-testing'></div></div>")
    $(document.body).append testElement

  get: ->
    $("##{TESTING_CONTAINER_ID}")

  clean: ->
    @get().remove()

  $: (args...) ->
    @get().find(args...)

  text: (selector) ->
    if arguments.length > 1
      $.trim @$(selector).text()
    else
      $.trim @get().text()
