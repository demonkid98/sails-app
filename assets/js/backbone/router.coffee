Router = Backbone.Router.extend
  routes:
    '': 'index'
    'user': 'user'
    'user/new': 'userNew'
  index: ->
    console.log 'index'
    $('#main').html ''
  user: ->
    view = new Views.UserList()
    $('#main').html view.el
  userNew: ->
    view = new Views.UserNew()
    $('#main').html view.el
