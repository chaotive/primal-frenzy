class CHAOTIVE.THREE.SHAPES.Box

  constructor: (x, y, z) ->
    geometry = new THREE.BoxGeometry( x, y, z )
    material = new THREE.MeshBasicMaterial( {color: 0xff0000} )
    mesh = new THREE.Mesh( geometry, material )

    return mesh
