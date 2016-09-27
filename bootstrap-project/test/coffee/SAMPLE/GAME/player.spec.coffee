describe 'Player', ->
  player = new SAMPLE.GAME.Player()
  
  it 'moveRel function', ->
    player.moveRel(1,1).should.equal 2
