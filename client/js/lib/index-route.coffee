App.IndexRoute = Ember.Route.extend

  model: ->
    EmberFire.Array.create
      ref: new Firebase('https://incandescent-fire-231.firebaseio.com')