class CHAOTIVE.THREE.SimpleCamera extends THREE.OrthographicCamera

  constructor: (x, y, z, cameraOptions = {}) ->
    super()
    @position.x = 10 #-20
    @position.y = 9 #-20
    @position.z = -12
    #@zoom = 2
    #@rotation.y = 90 * Math.PI / 180
    @rotation.x = 1.25
    @rotation.y = 0.7
    @rotation.z = 0.2
    
  updateAspect: (width, height) ->
    @left = width / -40
    @right = width / 40
    @top = height / 40
    @bottom = height / -40
    @near = -1000
    @far = 1000

  updatePosition: (axis, q) ->
    @position[axis] += q
    $("#position-debug").text(
      @position.x + " " + @position.y + " " + @position.z)

  updateRotation: (axis, q) ->
    pf = (n) -> n.toString().substring(0,5)
    @rotation[axis] += q/20
    $("#rotation-debug").text(
      pf(@rotation.x) + " " + pf(@rotation.y) + " " + pf(@rotation.z))

  updateZoom: (q) ->
    pf = (n) -> n.toString().substring(0,3)
    @zoom += q/10
    $("#zoom-debug").text(pf(@zoom))
    @updateProjectionMatrix()

class CHAOTIVE.THREE.ControlCamera extends THREE.PerspectiveCamera

  constructor: (@renderer, x, y, z, zoom, cameraOptions = {}) ->
    super( cameraOptions.fov, cameraOptions.aspect, cameraOptions.near, cameraOptions.far )
    @translateX x
    @translateY y
    @translateZ z
    @zoom = zoom
    pointLight = new THREE.PointLight( 0xffffff, 1, 100 )
    @add(pointLight)

    @controls = new CHAOTIVE.THREE.Controls(@, @renderer.domElement)
    @controls.enabled = true

  updateAspect: (width, height) -> @aspect = width / height