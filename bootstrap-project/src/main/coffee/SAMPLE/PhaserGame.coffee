class SAMPLE.PhaserGame extends CHAOTIVE.FW.APP.App

  constructor: (@configType = "main") ->
    console.log("Welcome to a Sample Phaser Game project: " + @configType)
    super(@configType, @start)

  start: () =>
    @game = new Phaser.Game(640, 360, Phaser.AUTO, "game")

    @game.state.add('menu', SAMPLE.STATES.Menu, false)
    @game.state.add('gameover', SAMPLE.STATES.GameOver, false)
    @game.state.start('menu')
