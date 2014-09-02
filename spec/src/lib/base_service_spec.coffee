BaseService = require('balanced/lib/base_service').default

describe 'BaseService', ->
  describe "#toString", ->
    it "should default to the standard behavior", ->
      expect((new BaseService).toString()).toEqual "[object Object]"
