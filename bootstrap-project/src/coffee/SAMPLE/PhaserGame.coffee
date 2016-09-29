class SAMPLE.PhaserGame

  constructor: (@configType) ->
    console.log("Welcome to a Sample Phaser Game project: " + @configType)
    @urlPrefix = switch @configType
      when 'dev' then "src/resources/"
      else ""
    @configUrl = @urlPrefix + "config/" + @configType + ".json"
    $.getJSON(@configUrl, (data) => @config = data; @start())

  start: () ->
    @game = new Phaser.Game(640, 360, Phaser.AUTO, "game")

    @game.state.add('menu', SAMPLE.STATES.Menu, false)
    @game.state.add('gameover', SAMPLE.STATES.GameOver, false)
    @game.state.start('menu')

