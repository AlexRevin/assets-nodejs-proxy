assets-nodejs-proxy
===================

Used by internal projects


supervisor -w "lib/,." app.coffee

coffee --watch --compile --output lib/ src/*
