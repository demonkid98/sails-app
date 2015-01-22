window.Models.User = Backbone.Model.extend
  defaults:
    username: null
    email: null
    dob: null
  urlRoot: '/user'
  idAttribute: 'id'
