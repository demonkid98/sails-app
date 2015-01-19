expect = require 'expect'

ErrorHandler = require '../../api/services/ErrorHandler'

describe 'ErrorHandler.response', ->
  it 'should accept and echo a String error', ->
    resp = ErrorHandler.response 'an error'
    expect(resp.status).toBe 'NOK'
    expect(resp.message).toBe 'an error'

  it 'should accept and print an Error object', ->
    err = new Error 'an error'
    resp = ErrorHandler.response err
    expect(resp.status).toBe 'NOK'
    expect(resp.message).toBe err.toString()

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

    resp = ErrorHandler.response err
    expect(resp.status).toBe 'NOK'
    expect(resp.message).toBe 'Validation error'
    expect(resp.errors.attr1).toBeA 'string'
    expect(resp.errors.attr1).toBe 'a message'
    expect(resp.errors.attr2).toBeA 'string'
    expect(resp.errors.attr2).toBe 'a message 3'
    expect(resp.errors.attr3).toBeA 'undefined'
