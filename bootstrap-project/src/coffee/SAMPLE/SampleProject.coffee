class SAMPLE.SampleProject

  constructor: (@configType) ->
    console.log("Welcome to the Sample Project: " + @configType)
    @urlPrefix = switch @configType
      when 'dev' then "src/resources/"
      else ""
    @configUrl = @urlPrefix + "config/" + @configType + ".json"
    $.getJSON(@configUrl, (data) => @config = data; @start())

  start: () ->
    alert("Application started: " + @config.welcome.message)
    @player = new SAMPLE.GAME.Player()
