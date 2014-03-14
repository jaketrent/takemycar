App.ApplicationController = Ember.Controller.extend({

  needs: ['match']

  cleanupMe: (->
    $(window).bind 'beforeunload', =>
      me = @get 'me'

      riders = @get('controllers.match.model')

      riders.forEach (rider) ->
        riderRiders = rider.get('riders')
        if riderRiders.contains me
          riderRiders.removeObject(me)
          rider.save()

      me.destroyRecord()

      'Please wait while we cleanup...'
  ).on('init')

})
