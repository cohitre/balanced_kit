`import BaseService from 'balanced/lib/base_service'`

describe 'BaseService', ->
  describe "#toString", ->
    it "should default to the standard behavior", ->
      expect((new BaseService).toString()).toEqual "[object Object]"
