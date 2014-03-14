App.MatchController = Ember.ArrayController.extend

  needs: ['application']

  actions:
    addMeAsRider: (rider) ->
      rider.addRider(@get('controllers.application.me'))
        .save()

  ridersBesidesMe: (->
    me = @get('controllers.application.me')
    models = @get('model')
    if not me
      models
    else
      models.filter (rider) ->
        rider.get('nick') isnt me.get('nick')
  ).property('models.@each')