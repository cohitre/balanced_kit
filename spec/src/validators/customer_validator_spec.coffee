CustomerValidator = require('balanced/validators/customer_validator').default

describe 'CustomerValidator', ->
  describe "dob_year", ->
    it "has valid values", ->
      validator = new CustomerValidator
      expect(validator.validate_field("dob_year", "2000")).toEqual([])

    it "should be an integer", ->
      validator = new CustomerValidator
      expect(validator.validate_field("dob_year", "20.00")).toEqual(["must be a whole number"])

    it "should be between 1000 and 2999", ->
      validator = new CustomerValidator
      expect(validator.validate_field("dob_year", "999")).toEqual(["must be between 1000 and 2999"])

    it "is optional", ->
      validator = new CustomerValidator
      expect(validator.validate_field("dob_year", "")).toEqual([])
      expect(validator.validate_field("dob_year", null)).toEqual([])

  describe "dob_month", ->
    it "has valid values", ->
      validator = new CustomerValidator
      expect(validator.validate_field("dob_month", 3)).toEqual([])

    it "is optional", ->
      validator = new CustomerValidator
      expect(validator.validate_field("dob_month", "")).toEqual([])
      expect(validator.validate_field("dob_month", null)).toEqual([])

    it "should be an integer", ->
      validator = new CustomerValidator
      expect(validator.validate_field("dob_month", "20.00")).toEqual(["must be a whole number"])

    it "should be between 1 and 12", ->
      validator = new CustomerValidator
      expect(validator.validate_field("dob_month", "0")).toEqual(["must be between 1 and 12"])
