App.MatchRoute = Ember.Route.extend

  model: ->
    @store.find 'rider'
