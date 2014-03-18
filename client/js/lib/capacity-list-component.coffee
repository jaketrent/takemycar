App.CapacityListComponent = Ember.Component.extend

  tagName: 'li'

  classNameBindings: ['isActive']

  actions:
    set: ->
      @sendAction 'click', @get('num')

  isActive: (->
    @get('num') is @get('capacity')
  ).property('num', 'capacity')