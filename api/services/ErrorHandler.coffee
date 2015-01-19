module.exports =
  response: (err) ->
    resp =
      status: 'NOK'

    if typeof err == 'string'
      resp.message = err
      return resp

    unless err.ValidationError?
      resp.message = err.toString()
      return resp

    errors = {}
    for attr, errList of err.ValidationError
      errors[attr] = errList[0].message

    resp.message = 'Validation error'
    resp.errors = errors
    resp
