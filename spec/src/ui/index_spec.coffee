UiModule = require('balanced/ui/index')['default']

describe "UiModule", ->
  describe "table", ->
    it "should delegate to TableBuilder when a callback is passed", ->
      spyOn UiModule.dependencies.TableBuilder, "build"
      callback = ->
      UiModule.table callback
      expect(UiModule.dependencies.TableBuilder.build).toHaveBeenCalledWith(callback)

    it "should delegate to TableBuilder when no arguments are passed", ->
      spyOn UiModule.dependencies.TableBuilder, "build"
      UiModule.table()
      expect(UiModule.dependencies.TableBuilder.build).toHaveBeenCalledWith()
