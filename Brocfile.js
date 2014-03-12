var coffee = require('broccoli-coffee')
var concat = require('broccoli-concat')

module.exports = function (broccoli) {

  var tree = broccoli.makeTree('client/js')

  tree = coffee(tree)

  tree = concat(tree, {
    inputFiles: [
      'bower_components/handlebars/handlebars.js',
      'bower_components/ember/ember.js',
      'bower_components/jquery/jquery.js',
      'bower_components/firebase/firebase.js',
      'vendor/emberfire-latest.js',
      'vendor/geoFire.js',
      'lib/**/*.js'
    ],
    outputFile: '/dist.js'
  })

  return tree
}