socket = io.connect('http://localhost:8080')
socket.on "push_image", (data) ->
  $('<img style="display: block;">').attr('src', data.dataUrl).prependTo($("body"));
  return
