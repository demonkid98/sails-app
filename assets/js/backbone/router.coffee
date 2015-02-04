Router = Backbone.Router.extend
  routes:
    '': 'index'
    'user': 'user'
    'user/new': 'userNew'
  index: ->
    $('#quick-form').html ''
    $('#content').html ''
  user: ->
    view = new Views.UserList()
    $('#quick-form').html ''
    $('#content').html view.el

  userNew: ->
    view = new Views.UserNew()
    $('#quick-form').html view.el
