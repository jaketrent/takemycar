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

        @removeLocalMeId()

        'Please wait while we cleanup...'
  ).on('init')

  removeLocalMeId: ->
    if window.localStorage?
      me = JSON.parse window.localStorage.getItem('takemycar-localme')
      if me?
        delete me.id
        window.localStorage.setItem('takemycar-localme', JSON.stringify me)

})
