App.RidersController = Ember.ArrayController.extend

  needs: ['application']

  ridersBesidesMe: (->
    me = @get('controllers.application.me')
    models = @get('model')
    if not me
      models
    else
      models.filter (rider) ->
        rider.get('nick') isnt me.get('nick')
  ).property('model.@each')

  me: Ember.computed.alias('controllers.application.me')
