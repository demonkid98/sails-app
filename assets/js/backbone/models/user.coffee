window.Models.User = Backbone.Model.extend
  defaults:
    username: null
    email: null
    dob: null
    createdAt: null
    updatedAt: null
  urlRoot: '/user'
  idAttribute: 'id'
