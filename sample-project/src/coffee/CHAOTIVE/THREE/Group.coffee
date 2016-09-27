class CHAOTIVE.THREE.Group extends THREE.Object3D

  constructor: (@de, @sprites) ->
    super()
    @add(s) for s in @sprites
    @de.env.scene.add(@)