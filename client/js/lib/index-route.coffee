#App.IndexRoute = Ember.Route.extend
#
#  model: ->
#    EmberFire.Array.create
#      ref: new Firebase('https://incandescent-fire-231.firebaseio.com')

App.IndexRoute = Ember.Route.extend

  model: ->
    @store.find('rider')

  renderTemplate: (controller, model) ->

    @render()

    @render 'riders',
      into: 'index'
      outlet: 'main'
      controller: @controllerFor('index')

    @render 'me',
      into: 'index'
      outlet: 'footer'
      controller: @controllerFor('me')