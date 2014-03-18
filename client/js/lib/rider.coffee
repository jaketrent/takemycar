App.Rider = FP.Model.extend
  nick: FP.attr 'string'
  capacity: FP.attr 'number'
  riders: FP.hasMany 'rider'

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

  percentFull: (->
    if @get('hasCapacity') then @get('ridersCount') / @get('capacity') * 100 else 0
  ).property('ridersCount', 'capacity')

  addRider: (rider) ->
    rider.set 'ridingWith', @
    @get('riders').pushObject rider
    @


