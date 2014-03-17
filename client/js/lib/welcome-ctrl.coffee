App.WelcomeController = Ember.ObjectController.extend

  needs: ['application']

  actions:
    initMe: (nick, capacity = 0) ->
      me = @get('model')

      me.setProperties
        nick: nick
        capacity: capacity

      @get('controllers.application').set('me', me)

      me.save().then =>
        if (me.get('hasCapacity'))
          @transitionToRoute 'drive'
        else
          @transitionToRoute 'match'

