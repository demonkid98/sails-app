expect = require 'expect.js'

ErrorHandler = require '../../api/services/ErrorHandler'

describe 'ErrorHandler.response', ->
  it 'should accept and echo a String error', ->
    expect(ErrorHandler.response('an error')).to.be 'an error'

  it 'should accept and print an Error object', ->
    err = new Error 'an error'
    expect(ErrorHandler.response(err)).to.be err.toString()

  it 'should accept an Error object with validation errors and return detailed report', ->
    err = new Error
    err.ValidationError =
      attr1: [{
        rule: 'a rule'
        message: 'a message'
      }, {
        rule: 'a rule 2'
        message: 'a message 2'
      }]
      attr2: [{
        rule: 'a rule 3'
        message: 'a message 3'
      }]

    expect(ErrorHandler.response(err)).to.be 'attr1: a message'
