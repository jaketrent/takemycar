App.RiderListComponent = Ember.Component.extend

  actions:
    join: ->
      @sendAction 'join', @get('rider')

  canJoin: (->
    @get('rider.canTakeRiders') and not @get('me.isRiding')
  ).property('rider.canTakeRiders', 'me.isRiding')
