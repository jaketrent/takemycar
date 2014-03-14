App.RiderListComponent = Ember.Component.extend

  actions:
    join: ->
      @sendAction 'join', @get('rider')
