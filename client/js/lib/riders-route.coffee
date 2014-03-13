App.RidersRoute = Ember.Route.extend

  model: ->
    @store.find 'rider'

