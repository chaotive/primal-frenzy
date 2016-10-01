organization = "CHAOTIVE"
namespaces =
  TEMPLATES:
    THREE:
      SHAPES: {}

top = if typeof exports isnt 'undefined' then global else window
top[organization] = {} if !top[organization]?
top[organization][k] = v for k,v of namespaces