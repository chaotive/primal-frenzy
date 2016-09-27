CHAOTIVE.UTIL.loadJSON = (url, objs, cb) -> $.getJSON(url, (data) ->
    top = if typeof exports isnt 'undefined' then global else window
    (top[obj] = data[obj]) for obj in objs
    cb()
  )

CHAOTIVE.UTIL.loadWhenCSAvailable = (f,p) -> f(p)