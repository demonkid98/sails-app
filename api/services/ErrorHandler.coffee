module.exports =
  response: (err) ->
    if typeof err == 'string'
      return err

    unless err.ValidationError?
      return err.toString()

    return "#{attr}: #{errList[0].message}" for attr, errList of err.ValidationError
    'Error'
