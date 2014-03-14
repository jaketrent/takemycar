App.Rider = DS.Model.extend
  nick: DS.attr 'string'
  capacity: DS.attr 'number'
  riders: DS.hasMany 'rider' #, { async: true }

  hasRiders: Ember.computed.gt('riders.length', 0)
  ridersCount: Ember.computed.alias('riders.length')

  isDriver: Ember.computed.gt('capacity', 0)

  canTakeRiders: (->
    @get('isDriver') and @get('ridersCount') < @get('capacity')
  ).property('ridersCount', 'isDriver', 'capacity')

  addRider: (rider) ->
    @get('riders').pushObject rider
    @
