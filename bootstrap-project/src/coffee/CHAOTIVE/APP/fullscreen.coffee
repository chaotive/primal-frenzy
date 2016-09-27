CHAOTIVE.APP.fullscreen.enter = (c) ->
  if (c.requestFullscreen) then c.requestFullscreen()
  if (c.webkitRequestFullscreen) then c.webkitRequestFullscreen()
  if (c.mozRequestFullScreen) then c.mozRequestFullScreen()
  if (c.msRequestFullscreen) then c.msRequestFullscreen()

CHAOTIVE.APP.fullscreen.exit = () ->
  if (document.exitFullscreen) then document.exitFullscreen()
  if (document.msExitFullscreen) then document.msExitFullscreen()
  if (document.mozCancelFullScreen) then document.mozCancelFullScreen()
  if (document.webkitExitFullscreen) then document.webkitExitFullscreen()
