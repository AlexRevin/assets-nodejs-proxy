require 'js-yaml'
mongo = require 'mongodb'
express = require 'express'
mongo = require 'mongodb'

app = express()
  
conf = require('./conf/app.yml')[app.get('env')]

serverOptions =
  auto_reconnect: true
  poolSize: 10

srv = new mongo.Server(conf.db_server, 27017, serverOptions)
manager = new mongo.Db(conf.db_collection, srv, {safe: true});
  # conn = mongo.connect "mongodb://#{conf.db_login}:#{conf.db_pass}@#{conf.db_server}/#{conf.db_collection}?auto_reconnect=true&safe=true", (e, c) ->

asset_klass = require('./lib/asset.js').Asset

manager.open (err, db) =>
  db.authenticate conf.db_login, conf.db_pass
  asset = new asset_klass conf, db
  
  app.get "/uploads/:image_id/:file_name", (req, res) ->
  asset.url req.params.image_id, req.params.file_name, (url) ->
    res.redirect url
    
app.listen conf.port
