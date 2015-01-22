window.Views.UserList = Backbone.View.extend
  tagName: 'section'
  className: 'item-list'

  initialize: ->
    $(@el).html _.template($('#user-list-tmpl').html())()

    _.bindAll this, 'addOne', 'addAll'

    @userList = new Collections.UserList()
    @userList.on 'add', @addOne
    @userList.on 'reset', @addAll
    @userList.fetch()

  addOne: (user) ->
    @$('table').append _.template($('#user-row-tmpl').html())(user.toJSON())

  addAll: ->
    console.log 'addAll'
