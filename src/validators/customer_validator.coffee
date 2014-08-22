`import BaseValidator from "balanced/lib/base_validator"`

tests = BaseValidator.tests

class CustomerValidator extends BaseValidator
  validators:
    dob_year: (value, errors) ->
      if tests.isBlank(value)
        return errors
      else if !(tests.isInteger(value) || tests.isIntegerString(value))
        errors.push "must be a whole number"
      else if !tests.isInRange(value, 1000, 2999)
        errors.push "must be between 1000 and 2999"
      errors

    dob_month: (value, errors) ->
      if tests.isBlank(value)
        return errors
      else if !(tests.isInteger(value) || tests.isIntegerString(value))
        errors.push "must be a whole number"
      else if !tests.isInRange(value, 1, 12)
        errors.push "must be between 1 and 12"
      errors

`export default CustomerValidator`
