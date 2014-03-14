App.WelcomeRoute = Ember.Route.extend

  model: ->
    @store.createRecord('rider')