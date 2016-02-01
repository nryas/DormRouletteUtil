socket = io.connect(location.href)
socket.on "push_image", (data) ->
  $('img').remove()
  $('<img style="display: block;">').attr('src', data.dataUrl).prependTo($("body")).fadeIn();
  return
