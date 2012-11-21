require 'js-yaml'
express = require 'express'
mongo = require 'mongodb'

app = express()
conf = require('./conf/app.yml')[app.get('env')]

asset_klass = require('./lib/asset.js').Asset

asset = new asset_klass conf
    
app.get "/uploads/:image_id/:file_name", (req, res) ->
  old = /asset/.test(req.path)
  asset.url req.params.image_id, req.params.file_name, old, (url) ->
    res.redirect url
    
app.listen conf.port
