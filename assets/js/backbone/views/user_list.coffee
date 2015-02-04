window.Views.UserList = Backbone.View.extend
  tagName: 'section'
  className: 'item-list'
  events:
    'click .user-edit': 'edit'
    'click .user-delete': 'delete'

  initialize: ->
    $(@el).html _.template(JST['user/list']())()

    _.bindAll this, 'addOne', 'addAll', 'remove'

    @userList = new Collections.UserList()
    @listenTo @userList, 'add', @addOne
    # @listenTo @userList, 'reset', @addAll
    @listenTo @userList, 'remove', @remove
    @userList.fetch()

  addOne: (user) ->
    @$('table').append _.template(JST['user/_list_item'](user.toJSON()))()

  addAll: ->
    console.log 'addAll'

  remove: (user) ->
    @$('table').find(""".user[data-user-id="#{user.id}"]""").remove()

  edit: (e) ->
    e.preventDefault()
    $target = $(e.currentTarget)
    uid = $target.data 'user-id'
    router.navigate "/user/#{uid}/edit", {trigger: true}

  delete: (e) ->
    e.preventDefault()
    $target = $(e.currentTarget)
    uid = $target.data 'user-id'
    user = @userList.get(uid)

    user.destroy
      success: (model, resp) =>
        @userList.remove user
        @render()

      error: (model, resp) ->
        console.log '<< error'
        console.log arguments
