App = Ember.Application.create()

var myRootRef = new Firebase('https://myprojectname.firebaseIO-demo.com/');
myRootRef.set('Hello World!')