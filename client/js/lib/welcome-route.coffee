App.WelcomeRoute = Ember.Route.extend

  model: ->
    defaults =
      capacity: 0

    localMe = @getLocalMe()
#    if localMe?.id?
#      @store.fetch 'rider', localMe.id
#    else
#      @store.createRecord 'rider', @getLocalMe() or defaults

    @store.createRecord 'rider', localMe or defaults

  getLocalMe: ->
    if window.localStorage?
      me = window.localStorage.getItem 'takemycar-localme'
      if me? then JSON.parse(me) else null