module.exports =
  # `UserController.index()`
  index: (req, res) ->
    User.find().exec (err, users) ->
      return res.status(406).send err.message if err?
      res.json users

  create: (req, res) ->
    options = req.param 'user', null
    return res.status(406).send 'invalid param' unless options?
    User.create(options).exec (err, user) ->
      if err?
        return res.status(406).send err.toString() unless err.ValidationError?
        output = {}
        for attr, errList of err.ValidationError
          output[attr] = errList[0].message

        return res.json
          status: 'NOK',
          error: output

      res.json
        status: 'OK',
        user: user

  update: (req, res) ->
    res.json
      todo: 'unimplemented'

  destroy: (req, res) ->
    res.json
      todo: 'unimplemented'

