describe 'Move', ->
  it 'constructor', ->
    obj =
      g:
        moving: []
    move = new DEC.GAME.Move(obj)
    move.state.should.equal false
#    grid = new DEC.MAP.Grid(1,1)
#    grid.width.should.equal 60
#    grid.height.should.equal 60
#
#    grid = new DEC.MAP.Grid(3,15)
#    grid.width.should.equal 180
#    grid.height.should.equal 900
