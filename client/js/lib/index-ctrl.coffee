App.IndexController = Ember.ArrayController.extend

  actions:
    addRider: (nick) ->
      console.log 'adding rider ' + nick