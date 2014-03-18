App.AddRiderComponent = Ember.Component.extend

  actions:
    add: ->
      @sendAction 'add', @get('nick'), @get('capacity')

    setCapacity: (capacity) ->
      @set 'capacity', capacity

  btnText: (->
    console.log "@get('capacity'): #{@get('capacity')}"
    console.log "@get('model.capacity'): #{@get('model.capacity')}"
    if @get('capacity') > 0 then "Drive" else "Catch a Ride"
  ).property('capacity')


  capacityRange: (->
    _.range(8)
  ).property()