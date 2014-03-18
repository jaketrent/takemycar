App.WelcomeController = Ember.ObjectController.extend

  needs: ['application']

  actions:
    initMe: (nick, capacity = 0) ->
      me = @get('model')

      props =
        nick: nick
        capacity: capacity

      me.setProperties props

      @get('controllers.application').set('me', me)

      me.save().then (me) =>
        @saveLocalMe me

        if (me.get('hasCapacity'))
          @transitionToRoute 'drive'
        else
          @transitionToRoute 'match'

  saveLocalMe: (me) ->
    if window.localStorage?
      props = me.getProperties 'id', 'nick', 'capacity'
      window.localStorage.setItem 'takemycar-localme', JSON.stringify props