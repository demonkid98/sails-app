expect = require 'expect.js'

ErrorHandler = require '../../api/services/ErrorHandler'

describe 'ErrorHandler.response', ->
  it 'should accept and echo a String error', ->
    resp = ErrorHandler.response 'an error'
    expect(resp.status).to.be 'NOK'
    expect(resp.message).to.be 'an error'

  it 'should accept and print an Error object', ->
    err = new Error 'an error'
    resp = ErrorHandler.response err
    expect(resp.status).to.be 'NOK'
    expect(resp.message).to.be err.toString()

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
    expect(resp.status).to.be 'NOK'
    expect(resp.message).to.be 'Validation error'
    expect(resp.errors).to.have.property 'attr1'
    expect(resp.errors.attr1).to.be 'a message'
    expect(resp.errors).to.have.property 'attr2'
    expect(resp.errors.attr2).to.be 'a message 3'
    expect(resp.errors).to.not.have.property 'attr3'
