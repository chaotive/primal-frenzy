organization = "SAMPLE"
namespaces =
  GAME: {}
  STATES: {}

top = if typeof exports isnt 'undefined' then global else window
top[organization] = {} if !top[organization]?
top[organization][k] = v for k,v of namespaces