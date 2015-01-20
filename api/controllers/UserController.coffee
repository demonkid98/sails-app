module.exports =
  index: (req, res) ->
    User.find().exec (err, users) ->
      return res.json(ErrorHandler.response(err)) if err?
      res.json users

  create: (req, res) ->
    options = req.body.user
    return res.json(ErrorHandler.response('invalid param')) unless options?

    User.create(options).exec (err, user) ->
      return res.json(ErrorHandler.response(err)) if err?
      res.json
        status: 'OK',
        user: user

  update: (req, res) ->
    options = req.body.user
    return res.json(ErrorHandler.response('invalid param')) unless options?

    User.update(req.params.id, options).exec (err, users) ->
      return res.json(ErrorHandler.response(err)) if err?
      return res.json(ErrorHandler.response('user not found')) unless users.length > 0

      res.json
        status: 'OK',
        users: users

  destroy: (req, res) ->
    User.destroy(req.params.id).exec (err, users) ->
      return res.json(ErrorHandler.response(err)) if err?
      return res.json(ErrorHandler.response('user not found')) unless users.length > 0

      res.json status: 'OK'
