require 'js-yaml'
express = require 'express'
mongo = require 'mongodb'

app = express()
conf = require('./conf/app.yml')[app.get('env')]

asset_klass = require('./lib/asset.js').Asset

asset = new asset_klass conf

app.get "/uploads/asset/image/:image_id/:file_name", (req, res) ->
  asset.url req.params.image_id, req.params.file_name, true, (url) ->
    res.redirect url
    
app.get "/uploads/:image_id/:file_name", (req, res) ->
  asset.url req.params.image_id, req.params.file_name, false, (url) ->
    res.redirect url
    
app.listen conf.port
