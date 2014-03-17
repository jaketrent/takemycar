App.RiderListComponent = Ember.Component.extend

  tagName: 'li'

  classNames: ['rider-item']

  classNameBindings: ['isMyRide']

  actions:
    join: ->
      @sendAction 'join', @get('rider')

    leave: ->
      @sendAction 'leave'

  canJoin: (->
    @get('rider.canTakeRiders') and not @get('me.isRiding')
  ).property('rider.canTakeRiders', 'me.isRiding')

  isMyRide: (->
    @get('me.ridingWith') is @get('rider')
  ).property('me.ridingWith', 'rider')
