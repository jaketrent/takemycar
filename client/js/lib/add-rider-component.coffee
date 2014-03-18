App.AddRiderComponent = Ember.Component.extend

  actions:
    add: ->
      @sendAction 'add', @get('rider.nick'), @get('rider.capacity')

    setCapacity: (capacity) ->
      @set 'rider.capacity', capacity

  btnText: (->
    if @get('rider.capacity') > 0 then "Drive" else "Catch a Ride"
  ).property('rider.capacity')


  capacityRange: (->
    _.range(8)
  ).property()