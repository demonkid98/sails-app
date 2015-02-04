module.exports =
  index: (req, res) ->
    User.find().exec (err, users) ->
      return res.send 400, ErrorHandler.response(err) if err?
      res.json users

  create: (req, res) ->
    options = req.body
    return res.send 400, ErrorHandler.response('invalid param') unless options?

    User.create(options).exec (err, user) ->
      return res.send 400, ErrorHandler.response(err) if err?
      res.json user

  update: (req, res) ->
    options = req.body
    return res.send 400, ErrorHandler.response('invalid param') unless options?

    User.update(req.params.id, options).exec (err, users) ->
      return res.send 400, ErrorHandler.response(err) if err?
      return res.send 400, ErrorHandler.response('user not found') unless users.length > 0

      res.json users

  destroy: (req, res) ->
    User.destroy(req.params.id).exec (err, users) ->
      return res.send 400, ErrorHandler.response(err) if err?
      return res.send 400, ErrorHandler.response('user not found') unless users.length > 0

      res.json status: 'OK'
