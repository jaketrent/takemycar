App.ApplicationController = Ember.Controller.extend({

  needs: ['match']

  cleanupMe: (->
    $(window).bind 'beforeunload', =>
      me = @get 'me'

      if me?

        ridingWith = me.get('ridingWith')
        if ridingWith?
          ridingWith.get('riders').removeObject me
          ridingWith.save()

        me.delete()

        'Please wait while we cleanup...'
  ).on('init')

})
