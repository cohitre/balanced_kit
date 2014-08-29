`import CustomerValidator from 'balanced/validators/customer_validator'`

describe 'CustomerValidator', ->
  describe "dob_year", ->
    it "should be an integer", ->
      validator = new CustomerValidator
      expect(validator.validate_field("dob_year", "20.00")).toEqual(["must be a whole number"])

    it "should be between 1000 and 2999", ->
      validator = new CustomerValidator
      expect(validator.validate_field("dob_year", "999")).toEqual(["must be between 1000 and 2999"])

  describe "dob_month", ->
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
