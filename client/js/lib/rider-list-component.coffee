App.RiderListComponent = Ember.Component.extend

  onMeChange: (->
    console.log 'component onMeChanged: ' + @get('me.nick')
  ).observes('me')

  actions:
    join: ->
      @sendAction 'join', @get('rider')
      alert 'joining' + @get('me.nick')

  didInsertElement: ->
    nick = @get('rider.nick')
    meNick = @get('me.nick')

    console.log "nick/meNick: #{nick}/#{meNick} == nick is meNick: #{nick is meNick}"

    @set 'isMe', nick is meNick
