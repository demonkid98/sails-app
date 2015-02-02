window.Views.UserNew = Backbone.View.extend
  tagName: 'section'
  className: 'user-form'
  events:
    'submit #user-new': 'createUser'

  initialize: ->
    @render()
  render: ->
    $(@el).html _.template(JST['user/new']())()
    @
  createUser: (e) ->
    e.preventDefault()

    user = @model ||= new Models.User()

    attrs = ['username', 'email', 'password', 'passwordConfirmation', 'dob']
    user.set attr, @$el.find("[name=\"user[#{attr}]\"]").val() for attr in attrs

    self = @
    user.save {},
      success: (collection, resp, options) ->
        if resp.status == 'NOK'
          console.log resp
          return
        self.trigger 'user:created', user
        router.navigate '/user', {trigger: true}

      error: ->
        console.error '----'
        console.log arguments
