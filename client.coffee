socket = io.connect(location.href)

socket.on "update", (data) ->
  eve = new Event("show_name")
  window.dispatchEvent(eve)
  # $('img').remove()
  # $('<img style="display: block;">').attr('src', data.dataUrl).prependTo($("body")).fadeIn();
  return
