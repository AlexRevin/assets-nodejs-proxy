// Generated by CoffeeScript 1.4.0
(function() {
  var app, express;

  express = require('express');

  app = express();

  app.get("/", function(req, res) {
    res.writeHead(200);
    return res.end('Hello, World!');
  });

  app.listen(3100);

}).call(this);
