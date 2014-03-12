App = Ember.Application.create()

App.IndexRoute = Ember.Route.extend({
  model: function () {
    return EmberFire.Array.create({
      ref: new Firebase('https://incandescent-fire-231.firebaseio.com')
    })
  }
})

// TODO: req'd for me to setup manually?
Ember.TEMPLATES = {}

//var ref = new Firebase('https://incandescent-fire-231.firebaseio.com');
//ref.push({
//  name: 'Jake',
//  driver: false
//})
//
//ref.on('child_added', function (snapshot) {
//  var msg = snapshot.val()
//  console.log('added ' + msg.name + ' (driver: ' + msg.driver + ')')
//})