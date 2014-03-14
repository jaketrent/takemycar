App.WelcomeController = Ember.ObjectController.extend

  needs: ['application']

  actions:
    matchMe: (nick, capacity = 0) ->
      console.log "matching: #{nick} #{capacity}"

      me = @get('model')

      me.setProperties
        nick: nick
        capacity: capacity

      @get('controllers.application').set('me', me)

      me.save().then =>
        @transitionToRoute 'match'