App.AddRiderComponent = Ember.Component.extend

  actions:
    add: ->
      @sendAction 'add', @get('nick'), @get('capacity')