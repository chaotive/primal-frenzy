class SAMPLE.GAME.Util

  @preload: (game) ->
    images =
      'chaotive': 'img/chaotive.png'
      'bg1': 'img/bg/bg_1.jpg'
      'bg2': 'img/bg/bg_2.jpg'
      'startbutton': 'img/ui/button_start_1.png'
      'spr1': 'img/sprites/spr_1.png'
    game.load.image(k, app.urlPrefix + v) for k,v of images
