App.MatchRoute = Ember.Route.extend

  beforeModel: ->
    if not @controllerFor('application').get('me')?
      @transitionTo 'welcome'

  model: ->
    @store.find 'rider'
