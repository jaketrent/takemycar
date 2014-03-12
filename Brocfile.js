require('dotenv').load()

var config = require('config')

var coffee = require('broccoli-coffee')
var concat = require('broccoli-concat')
var jade = require('broccoli-jade')
var env = require('broccoli-env').getEnv()

module.exports = function (broccoli) {

  console.log('broccoli.getEnv()')
  console.log(env)

  var jsTree = broccoli.makeTree('client/js')

  jsTree = coffee(jsTree)

  jsTree = concat(jsTree, {
    inputFiles: [
      'bower_components/jquery/jquery.js',
      'bower_components/handlebars/handlebars.js',
      'bower_components/ember/ember.js',
      'bower_components/firebase/firebase.js',
      'vendor/emberfire-latest.js',
      'vendor/geoFire.js',
      'lib/**/*.js'
    ],
    outputFile: '/dist.js'
  })


  var tmplTree = broccoli.makeTree('client/tmpl')

  tmplTree =  jade(tmplTree, {
    data: config
  })

  return [ jsTree, tmplTree ]
}