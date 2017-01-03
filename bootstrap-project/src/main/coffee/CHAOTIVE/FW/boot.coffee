top = if typeof exports isnt 'undefined' then global else window

top.bundle = ({organization, namespaces}) ->
  top[organization] = {} if !top[organization]?
  top[organization][k] = v for k,v of namespaces

top.initRendering = () ->
  try
    console.log("Attempting start...")
    CHAOTIVE.FW.UTIL.loadWhenCSAvailable(start)
    console.log("... application started! :)")
  catch err
    console.log("Still loading: " + err.message);
    setTimeout(initRendering, 200);

top.init = () ->
  if !chfwSettings? then top.chfwSettings = {}
  initRendering()

init()
