Router = Backbone.Router.extend
  routes:
    '': 'index'
    'user': 'user'
    'user/new': 'newUser'
  index: ->
    console.log 'index'
    $('#main').html ''
  user: ->
    view = new Views.UserList()
    $('#main').html view.el
  newUser: ->
    view = new Views.UserForm()
    $('#main').html view.el
