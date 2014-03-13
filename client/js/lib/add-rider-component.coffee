App.AddRiderComponent = Ember.Component.extend

  add: 'addRider'

  actions:
    add: ->
      @sendAction 'add', @get('nick')