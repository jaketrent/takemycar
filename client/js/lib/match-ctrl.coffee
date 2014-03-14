App.MatchController = Ember.ArrayController.extend

  needs: ['application']

  actions:
    addMeAsRider: (rider) ->
      me = @get('controllers.application.me')
      me.set 'isRiding', true
      rider.addRider(me)
        .save()

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