App = Ember.Application.create()

App.ApplicationController =  Ember.Controller.extend

  ref: new Firebase('https://incandescent-fire-231.firebaseio.com')

Ember.TEMPLATES = {}








#var ref = new Firebase('https://incandescent-fire-231.firebaseio.com');
#ref.push({
#  name: 'Jake',
#  driver: false
#})
#
#ref.on('child_added', function (snapshot) {
#  var msg = snapshot.val()
#  console.log('added ' + msg.name + ' (driver: ' + msg.driver + ')')
#})