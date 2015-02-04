window.Views.UserNew = Backbone.View.extend
  tagName: 'section'
  className: 'user-form'
  events:
    'submit #user-new': 'createUser'

  initialize: ->
    @model ||= new Models.User()
    @render()

  render: ->
    @$el.html _.template(JST['user/new']())(errors: {})
    @

  createUser: (e) ->
    e.preventDefault()

    data = {}
    attrs = ['username', 'email', 'password', 'passwordConfirmation', 'dob']
    data[attr] = @$el.find("""[name="#{attr}"]""").val() for attr in attrs

    @model.save data,
      beforeSend: =>
        @clearFlash()
      success: (model, resp) =>
        @trigger 'user:created', model
        router.navigate '/user', {trigger: true}
      error: (model, resp) =>
        @showFlash resp.responseText, 'alert'

  clearFlash: ->
    @$('.alert-box').remove()
  showFlash: (msg, klass) ->
    @$el.prepend """<div class="#{klass} alert-box">#{msg}</div>"""
