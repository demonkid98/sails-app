window.Views.UserList = Backbone.View.extend
  tagName: 'section'
  className: 'item-list'

  initialize: ->
    $(@el).html _.template(
      """
        <table class="full-width user-list">
          <thead>
            <tr>
              <th>#</th>
              <th>Username</th>
              <th>Email</th>

              <th>Created</th>
              <th>Updated</th>
            </tr>
          </thead>
        </table>
      """
    )()

    _.bindAll this, 'addOne', 'addAll'

    @userList = new Collections.UserList()
    @userList.on 'add', @addOne
    @userList.on 'reset', @addAll
    @userList.fetch()

  addOne: (user) ->
    @$('table').append _.template(
      """
        <tr>
          <td> - </td>
          <td>{{ username }}</td>
          <td>{{ email }}</td>

          <td>{{ createdAt }}</td>
          <td>{{ updatedAt }}</td>
        </tr>
      """
    )(user.toJSON())

  addAll: ->
    console.log 'addAll'
