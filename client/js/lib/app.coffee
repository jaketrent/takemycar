App = Ember.Application.create()

App.Store = FP.Store.extend
  firebaseRoot: 'https://incandescent-fire-231.firebaseio.com'

App.Router.map ->
  @route 'welcome', { path: '/' }
  @route 'match', { path: '/match' }
  @route 'drive', { path: '/drive' }

Ember.TEMPLATES = {}

Ember.TextField.reopen
  attributeBindings: ['autofocus']


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