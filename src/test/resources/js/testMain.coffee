window.start = () ->
  window.SG = {}

  Promise.all([
    'SG/App'
  ].map( (url) ->
    System['import'](url)
  )).then (modules) ->
    window.SG["App"] = modules[0]["App"]

    runner = mocha.run()
