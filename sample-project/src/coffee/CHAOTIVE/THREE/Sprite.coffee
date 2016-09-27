class CHAOTIVE.THREE.Sprite extends THREE.Sprite

  constructor: (textureId) ->
    @texture = THREE.loader.textures[textureId]
    material = new THREE.SpriteMaterial( { map: @texture, color: 0xffffff, fog: true } )
    super( material )
