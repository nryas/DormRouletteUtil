udp = require("dgram").createSocket("udp4")
app = require("express")();
io  = require("socket.io")(app)
emitter = new require("events").EventEmitter()

sock = udp.createSocket "udp4", (msg, rinfo)->
  emitter.emit "osc", msg
sock.bind 1994

app.get "/", (req, res)->
  res.sendFile "index.html"

io.on "connection", ()
