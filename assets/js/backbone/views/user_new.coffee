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

    self = @
    @model.save data,
      beforeSend: ->
        self.clearFlash()
      success: (model, resp, options) ->
        self.trigger 'user:created', model
        router.navigate '/user', {trigger: true}
      error: (model, resp, options) ->
        self.showFlash resp.responseText, 'error'

  clearFlash: ->
    console.log 'aaa'
    @$('.flash').remove()
  showFlash: (msg, klass) ->
    @$el.prepend """<div class="#{klass} flash">#{msg}</div>"""
