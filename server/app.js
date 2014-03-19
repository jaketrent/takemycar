const path = require('path')
const express = require('express')

const port = process.env.PORT || 3000
const app = express()

const assetsPath = 'public'

app.get('/', function(req, res) {
  res.sendfile(path.join(__dirname, assetsPath, 'index.html'))
}).configure(function() {
  app.use('/' + assetsPath, express.static(path.join(__dirname, assetsPath)))
}).listen(port)