`import BaseValidator from 'balanced/lib/base_validator'`

describe 'BaseValidator', ->
  describe ".tests", ->
    tests = BaseValidator.tests
    describe '.isBlank', ->
      it 'should be true for undefined and null', ->
        expect(tests.isBlank(undefined)).toBe true
        expect(tests.isBlank(null)).toBe true

      it 'should be true for blank strings', ->
        expect(tests.isBlank("     ")).toBe true
        expect(tests.isBlank(" c")).toBe false

    describe '.isInteger', ->
      it "should handle numbers", ->
        expect(tests.isInteger(10)).toBe true
        expect(tests.isInteger(-10)).toBe true
        expect(tests.isInteger(10.0)).toBe true

        expect(tests.isInteger(10.2)).toBe false
        expect(tests.isInteger("10")).toBe false
        expect(tests.isInteger("ten")).toBe false
        expect(tests.isInteger({})).toBe false

    describe '.isIntegerString', ->
      it "should handle number strings", ->
        expect(tests.isIntegerString(10)).toBe false
        expect(tests.isIntegerString("10")).toBe true
        expect(tests.isIntegerString("10.0")).toBe false
        expect(tests.isIntegerString("ten")).toBe false
        expect(tests.isIntegerString({})).toBe false

    describe '.isInRange', ->
      it "should handle strings and integers", ->
        expect(tests.isInRange("3", 2, 4)).toBe true
        expect(tests.isInRange("10", 2, 4)).toBe false
        expect(tests.isInRange(3, 2, 4)).toBe true
        expect(tests.isInRange(30, 2, 4)).toBe false

  describe "#validate_field", ->
    it "should run the validator", ->
      validatorMethod = jasmine.createSpy('validator')
      validatorMethod.and.returnValue(["xxxxx"])

      class Test extends BaseValidator
        validators:
          name: (value, errors) ->
            validatorMethod(value)
            errors.push "xxxxx"

      validator = new Test
      result = validator.validate_field "name", "value"
      expect(validatorMethod).toHaveBeenCalledWith "value"
      expect(result).toEqual(["xxxxx"])

  describe "#validate", ->
    it "should run the validations", ->
      validatorMethod = jasmine.createSpy('validator')
      validatorMethod.and.returnValue(["xxxxx"])

      class Test extends BaseValidator
        validators:
          name: (value, errors) ->
            validatorMethod(value)
            errors.push "xxxxx"

      validator = new Test
      result = validator.validate(name: "Dr. Test")
      expect(validatorMethod).toHaveBeenCalledWith "Dr. Test"
      expect(result.getErrorMessages()).toEqual(['xxxxx'])
