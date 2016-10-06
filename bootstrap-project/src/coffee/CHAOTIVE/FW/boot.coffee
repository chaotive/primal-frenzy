top = if typeof exports isnt 'undefined' then global else window

top.bundle = ({organization, namespaces}) ->
  top[organization] = {} if !top[organization]?
  top[organization][k] = v for k,v of namespaces

top.init = (config) ->
  try
    console.log("Attempting start...")
    CHAOTIVE.FW.UTIL.loadWhenCSAvailable(start, config)
    console.log("... application started! :)")
  catch err
    console.log("Still loading: " + err.message);
    setTimeout(init, 200, config);
