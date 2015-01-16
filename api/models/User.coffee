module.exports =
  types:
    password: (password) ->
      password == this.passwordConfirmation

  attributes:
    username:
      type: 'string'
      required: true
      minLength: 3
      maxLength: 20
      regex: /^[a-z0-9\.\-_]+$/i
      unique: true
    password:
      type: 'string'
      protected: true
      required: true
      minLength: 3
      password: true

  beforeValidation: (attrs, cb) ->
    for attr, value of attrs
      continue if ['password', 'passwordConfirmation'].indexOf(attr) >= 0
      attrs[attr] = value.trim()
    console.log attrs
    console.log '***'
    cb()

  beforeCreate: (attrs, cb) ->
    bcrypt = require 'bcrypt'
    bcrypt.hash attrs.password, 10, (err, hash) ->
      return cb(err) if err?
      attrs.password = hash
      delete attrs.passwordConfirmation
      cb()
