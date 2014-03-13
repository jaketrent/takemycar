App.MeController = Ember.Controller.extend

  needs: ['index']

  actions:
    addRider: (nick, capacity = 0) ->
      rider = @store.createRecord 'rider',
        nick: nick,
        capacity: capacity

      @get('controllers.index').set 'me', rider

      rider.save()

#      @store.createRecord('rider',
#        nick: nick,
#        capacity: capacity
#      ).save().then (rider) =>
#        console.log 'in create callback: ' + rider.get('nick')
#
#        @get('controllers.index').set 'me', rider

