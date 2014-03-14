App.MatchController = Ember.ArrayController.extend

  needs: ['application']

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

  me: Ember.computed.alias('controllers.application.me')

  ridersBesidesMe: (->
    me = @get('controllers.application.me')
    models = @get('model')
    if not me
      models
    else
      models.filter (rider) ->
        rider.get('nick') isnt me.get('nick')
  ).property('model.@each')

  notRidingWhenRiderLeaves: (->
    ridingWith = @get('me.ridingWith')
    if ridingWith? and not @get('model').contains ridingWith
      @get('me').set 'ridingWith', null
  ).observes('model.@each')