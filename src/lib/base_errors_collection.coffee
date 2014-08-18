class BaseErrorsCollection
  constructor: ->
    @errors = []

  addError: (field, message) ->
    @errors.push(
      field: field
      message: message
    )

  getErrorMessages: ->
    for error in @errors
      error.message

`export default BaseErrorsCollection`
