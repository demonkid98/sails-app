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
    email:
      type: 'string'
      required: true
      email: true
      unique: true
    password:
      type: 'string'
      protected: true
      required: true
      minLength: 3
      password: true
    dob:
      type: 'date'
      date: true

  beforeValidation: (attrs, cb) ->
    for attr, value of attrs
      continue if ['password', 'passwordConfirmation'].indexOf(attr) >= 0
      attrs[attr] = value.trim()
    cb()

  beforeCreate: (attrs, cb) ->
    this.hashPassword(attrs, cb)

  beforeUpdate: (attrs, cb) ->
    this.hashPassword(attrs, cb)

  hashPassword: (attrs, cb) ->
    bcrypt = require 'bcrypt'
    bcrypt.hash attrs.password, 10, (err, hash) ->
      return cb(err) if err?
      attrs.password = hash
      delete attrs.passwordConfirmation
      cb()
