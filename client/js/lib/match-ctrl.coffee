App.MatchController = Ember.ArrayController.extend

  needs: ['application']

  actions:
    addMeAsRider: (rider) ->
      me = @get('me')
      rider.addRider(me)
      rider.save()

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
    if not @get('model').contains @get('me.ridingWith')
      @set 'me.ridingWith', null
  ).observes('model.@each')