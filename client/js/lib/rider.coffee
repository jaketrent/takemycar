App.Rider = DS.Model.extend
  nick: DS.attr 'string'
  capacity: DS.attr 'number'
  riders: DS.hasMany 'rider'

  # removing until emberFire/ember-data will persist riders w/ it
  #  riders: DS.hasMany 'rider', { inverse: 'drive' }
  #  driver: DS.belongsTo 'rider', { inverse: 'riders' }

  hasRiders: Ember.computed.gt('riders.length', 0)
  ridersCount: Ember.computed.alias('riders.length')
  hasCapacity: Ember.computed.gt('capacity', 0)
  ridingWith: null
  isRiding: Ember.computed.bool('ridingWith')

  canTakeRiders: (->
    @get('hasCapacity') and @get('ridersCount') < @get('capacity')
  ).property('ridersCount', 'hasCapacity', 'capacity')

  addRider: (rider) ->
    rider.set 'ridingWith', @
    @get('riders').pushObject rider
    @
