socket = io.connect(location.href)
socket.on "push_image", (data) ->
  $('img').fadeOut()
  $('<img style="display: block;">').attr('src', data.dataUrl).fadeIn()
  return
