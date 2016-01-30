socket = io.connect(location.href)
socket.on "push_image", (data) ->
  $('<img style="display: block;">').attr('src', data.dataUrl).prependTo($("body"));
  return
