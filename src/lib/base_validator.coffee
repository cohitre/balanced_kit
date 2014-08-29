`import BaseErrorsCollection from "./base_errors_collection"`

class BaseValidator
  @tests:
    isBlank: (value) ->
      if _.isString(value)
        return value.replace(/\s+$/g, "").replace(/^\s+/g, "").length == 0
      else
        return _.isUndefined(value) || _.isNull(value)
    isInteger: (value) ->
      !!(_.isNumber(value) && value % 1 == 0)
    isIntegerString: (value) ->
      !!(_.isString(value) && value.match(/^\d+$/))
    isInRange: (value, start, end) ->
      value = parseFloat(value)
      start <= value && value <= end

  validate_field: (field, value) ->
    errors = []
    @validators[field](value, errors)
    errors

  validate: (object) ->
    collection = new BaseErrorsCollection
    for attrName, method of @validators
      errors = @validate_field(attrName, object[attrName])
      for error in errors
        collection.addError(attrName, error)
    collection

`export default BaseValidator`
