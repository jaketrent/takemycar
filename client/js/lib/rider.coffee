App.Rider = DS.Model.extend
  nick: DS.attr 'string'
  capacity: DS.attr 'number'
  riders: DS.hasMany 'rider' #, { inverse: 'drive' }

  # removing until emberFire/ember-data will persist riders w/ it
  #driver: DS.belongsTo 'rider', { inverse: 'riders' }

  hasRiders: Ember.computed.gt('riders.length', 0)
  ridersCount: Ember.computed.alias('riders.length')

  isDriver: Ember.computed.gt('capacity', 0)

  isRiding: Ember.computed.bool('ridingWith')

  canTakeRiders: (->
    @get('isDriver') and @get('ridersCount') < @get('capacity')
  ).property('ridersCount', 'isDriver', 'capacity')

  addRider: (rider) ->
    rider.set 'ridingWith', @
    @get('riders').pushObject rider
    @
