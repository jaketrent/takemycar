App.IndexController = Ember.ArrayController.extend

  onMeChange: (->
    console.log 'indexctrl onMeChanged: ' + @get('me.nick')
  ).observes('me')

  actions:
    addMeAsRider: (rider) ->
      rider.get('riders').pushObject(@get('me'))
