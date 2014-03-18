App.WelcomeRoute = Ember.Route.extend

  model: ->
    defaults =
      capacity: 0
    @store.createRecord 'rider', defaults