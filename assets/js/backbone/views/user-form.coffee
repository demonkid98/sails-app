window.Views.UserForm = Backbone.View.extend
  tagName: 'section'
  className: 'user-form'
  events:
    'submit #user-form': 'createUser'

  initialize: ->
    @render()
  render: ->
    $(@el).html _.template(JST['user/new']())()
    @
  createUser: (e) ->
    e.preventDefault()

    user = @model ||= new Models.User()

    attrs = ['username', 'email', 'password', 'passwordConfirmation', 'dob']
    for attr in attrs
      user.set attr, @$el.find("[name=\"user[#{attr}]\"]").val()

    user.save {},
      success: ->
        console.log arguments
      error: ->
        console.error '----'
        console.log arguments
