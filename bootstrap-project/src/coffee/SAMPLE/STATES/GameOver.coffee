class SAMPLE.STATES.GameOver extends Phaser.State

  constructor: (@app) -> @game = @app.game

  create: () ->
    @game.add.sprite(0, 0, 'bg2')
    @sprite = @game.add.sprite(220, 80, 'chaotive')
    @sprite.inputEnabled = true
    @sprite.events.onInputDown.add(@action,@)

  action: () ->
    @game.state.start('menu')
