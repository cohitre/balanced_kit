UiModule = require('balanced/ui/index').default

describe "UiModule", ->
  describe "table", ->
    it "should delegate to TableBuilder when a callback is passed", ->
      toEmberClassSpy = jasmine.createSpy()
      spyOn(UiModule.dependencies.TableBuilder, "build").and.returnValue(
        toEmberClass: toEmberClassSpy
      )
      callback = ->
      UiModule.table "table", callback
      expect(UiModule.dependencies.TableBuilder.build).toHaveBeenCalledWith("table", callback)
      expect(toEmberClassSpy).toHaveBeenCalledWith()
