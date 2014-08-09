$ ->
  $('.example-app').each ->
    fileNames = @getAttribute('data-files').split(" ")
    name = @getAttribute("data-name")
    (new ExampleLoader(name, fileNames)).load(@)

class ExampleLoader
  constructor: (@name, fileNames) ->
    @fileNames = Ember.A(fileNames)

  loadFiles: ->
    promises = @fileNames.map (file) =>
      $.ajax "/javascripts/examples/#{@name}/#{file}", {
        dataType: 'text'
      }

    Ember.RSVP.all(promises).then (files) =>
      files.map (file, i) =>
        name: @fileNames[i]
        contents: file

  load: (destinationElement) ->
    this
      .loadFiles()
      .then (files) =>
        viewer = $("<div class='example-viewer'></div>")
          .appendTo($("<div class='col-md-6'></div>").appendTo(destinationElement))
          .get(0)
        output = $('<div class="example-output"></div>')
          .appendTo($("<div class='col-md-6'></div>").appendTo(destinationElement))
          .get(0)
        @appendViewer(viewer, files)
        @appendOutput(output, files)

  appendViewer: (element, files) ->
    App = Ember.Application.create
      rootElement: element

    App.ApplicationRoute = Ember.Route.extend
      model: -> return files
      setupController: (controller, model) ->
        controller.setProperties(
          model: model,
          selectedTab: model[0]
        )

    App.ApplicationController = Ember.ArrayController.extend
      actions:
        selectTab: (tab) ->
          @set('selectedTab', tab)

    App.TabItemController = Ember.ObjectController.extend
      needs: 'application',

      isSelected: (->
        @get('model') == @get('controllers.application.selectedTab')
      ).property('controllers.application.selectedTab')

  appendOutput: (element, files) ->
    templates = {}
    scripts = []

    files.forEach (file) ->
      parts = file.name.split('.')
      name = parts[0]
      extension = parts[1]

      if extension == 'hbs'
        if (name.substr(0, 10) == "templates/")
          name = name.substr(10)
          file.name = name + '.' + extension
        templates[name] = Ember.Handlebars.compile(file.contents)
      else if (extension == 'js')
        scripts.push(file.contents)

    App = Ember.Application.create
      rootElement: element
      Resolver: Ember.DefaultResolver.extend(
        resolveTemplate: (obj) ->
          return templates[obj.name]
      )

    App.Router.reopen
      location: 'none'

    scripts.forEach (script) ->
      eval(script)
