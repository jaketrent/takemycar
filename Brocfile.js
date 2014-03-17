require('dotenv').load()

var config = require('config')

var coffee = require('broccoli-coffee')
var concat = require('broccoli-concat')
var jade = require('broccoli-jade')
var stylus = require('broccoli-stylus')
var pickFiles = require('broccoli-static-compiler')
var emblem = require('./broccoli-ember-emblem')

module.exports = function (broccoli) {

  var jsTree = broccoli.makeTree('client/js')

  jsTree = coffee(jsTree, {
    bare: true
  })


  var tmplTree = broccoli.makeTree('client/tmpl')

  tmplTree = emblem(pickFiles(tmplTree, {
    srcDir: '/',
    destDir: '/tmpl'
  }), {
    stripPathFromName: 'tmpl/'
  })

  var scriptTree = new broccoli.MergedTree([jsTree, tmplTree])

  scriptTree = concat(scriptTree, {
    inputFiles: [
      'bower_components/jquery/jquery.js',
      'bower_components/handlebars/handlebars.js',
      'bower_components/firebase/firebase.js',
      'bower_components/ember/ember.js',
      'bower_components/ember-data/ember-data.js',
      'vendor/emberfire-latest.js',
      'vendor/geoFire.js',
      'bower_components/underscore/underscore.js',
      'lib/app.js',
      'lib/**/*.js',
      'tmpl/**/*.js'
    ],
    outputFile: '/js/dist.js'
  })

  var viewTree = broccoli.makeTree('client/views')

  viewTree =  jade(viewTree, {
    data: config
  })

  var cssTree = broccoli.makeTree('client/css')

  cssTree = stylus(pickFiles(cssTree, {
    srcDir: '/',
    destDir: '/css'
  }))

  return [ scriptTree, viewTree, cssTree ]
}