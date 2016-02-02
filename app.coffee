express = require "express"
http    = require "http"
app     = express()
server  = http.createServer(app)
io      = require("socket.io")(server)
fs      = require "fs"

app.use express.static("public")

bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({extended: false}))

app.get "/", (req, res) ->
  res.render "index.jade", {title: "My Site"}

app.post "/", (req, res) ->
  console.log(req.params)
  res.send("accepted")
server.listen(process.env.PORT||3000)
# server.listen(3000)

  # io.sockets.emit "update", req.body
  # form = new multiparty.Form()
  # form.parse req, (err, fieldsObject, filesObject, fieldsList, filesList) ->
    # img = filesObject
    # path = img['uploaded'][0].path
    # fs.readFile path, (err, buf) ->
      # if err?
        # res.status(422)
        # return
      # data = buf.toString("base64")
      # io.sockets.emit "push_image", {dataUrl: util.format("data:%s;base64,%s", mime.lookup(path), data)}
