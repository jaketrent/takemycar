App.DriveController = App.RidersController.extend

  slotsRangeRemaining: (->
    _.range(@get('me.ridersCount') + 1, @get('me.capacity') + 1)
  ).property('me.ridersCount', 'me.capacity')
