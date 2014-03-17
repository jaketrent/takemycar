App.MatchController = App.RidersController.extend

  actions:
    addMeAsRider: (rider) ->
      me = @get('me')
      rider.addRider(me)
      rider.save()

    removeMeAsRider: ->
      ridingWith = @get('me.ridingWith')
      ridingWith.get('riders').removeObject @get 'me'
      ridingWith.save()
      @get('me').set 'ridingWith', null

  notRidingWhenRiderLeaves: (->
    ridingWith = @get('me.ridingWith')
    if ridingWith? and not @get('model').contains ridingWith
      @get('me').set 'ridingWith', null
  ).observes('model.@each')