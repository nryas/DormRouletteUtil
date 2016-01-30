express = require "express"
http    = require "http"
app     = express()
server  = http.createServer(app)
io      = require("socket.io")(server)
util    = require "util"
mime    = require "mime"
fs      = require "fs"
multiparty = require "multiparty"
app.use express.static("public")

app.get "/", (req, res) ->
  res.render "index.jade", {title: "My Site"}

app.post "/", (req, res) ->
  form = new multiparty.Form()
  form.parse req, (err, fieldsObject, filesObject, fieldsList, filesList) ->
    img = filesObject
    path = img['uploaded'][0].path
    fs.readFile path, (err, buf) ->
      if err?
        res.status(422)
        return
      data = buf.toString("base64")
      io.sockets.emit "push_image", {dataUrl: util.format("data:%s;base64,%s", mime.lookup(path), data)}
      res.end()
server.listen(process.env.PORT)
