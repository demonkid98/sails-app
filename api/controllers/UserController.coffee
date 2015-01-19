module.exports =
  index: (req, res) ->
    User.find().exec (err, users) ->
      return res.json(ErrorHandler.response(err)) if err?
      res.json users

  create: (req, res) ->
    options = req.param 'user', null
    return res.json(ErrorHandler.response('invalid param')) unless options?
    User.create(options).exec (err, user) ->
      console.log err.ValidationError
      return res.json(ErrorHandler.response(err)) if err?
      res.json
        status: 'OK',
        user: user

  update: (req, res) ->
    res.json
      todo: 'unimplemented'

  destroy: (req, res) ->
    res.json
      todo: 'unimplemented'

