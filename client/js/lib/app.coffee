App = Ember.Application.create()

App.ApplicationAdapter = DS.FirebaseAdapter.extend
  firebase: new Firebase('https://incandescent-fire-231.firebaseio.com')

Ember.TEMPLATES = {}








#ref = new Firebase('https://incandescent-fire-231.firebaseio.com').child('riders');
#ref.push({
#  nick: 'Jake',
#  capacity: 0
#})
#
#ref.on('child_added', function (snapshot) {
#  var msg = snapshot.val()
#  console.log('added ' + msg.name + ' (driver: ' + msg.driver + ')')
#})