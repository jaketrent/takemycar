App.ApplicationController = Ember.Controller.extend({

  needs: ['match']

  cleanupMe: (->
    $(window).bind 'beforeunload', =>
      me = @get 'me'

      ridingWith = me.get('ridingWith')
      ridingWith.get('riders').removeObject me
      ridingWith.save()

      me.destroyRecord()

      'Please wait while we cleanup...'
  ).on('init')

})
