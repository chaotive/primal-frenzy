class CHAOTIVE.THREE.Environment

  constructor: (renderAlpha, canvasId) ->
    @init(renderAlpha, canvasId)
    @render()

  init: (renderAlpha, canvasId) ->
    @canvas = document.getElementById(canvasId);
    @parent = @canvas.parentNode.parentNode
    @scene = new CHAOTIVE.THREE.Scene()
    @renderer = new THREE.WebGLRenderer( { canvas: @canvas, alpha: renderAlpha, antialiasing: true } )

    @setSize()
    #@camera = new CHAOTIVE.THREE.ControlCamera(@renderer, 0, -45, 45, 2)
    @camera = new CHAOTIVE.THREE.SimpleCamera(@size.width, @size.height)
    @scene.add( @camera )

    @updateRendererSize()

    # lights
    ambient = new THREE.AmbientLight( 0x444444 );
    @scene.add( ambient );

    @applyExtraHtml()

    #window behaviours listeners
    window.addEventListener( 'resize', @updateRendererSize, false )

  render: () ->
    requestAnimationFrame => @render()
    TWEEN.update()
    @renderer.render( @scene, @camera )

  setSize: () ->
    @size =
      width: @parent.offsetWidth - 150
      #height: @parent.offsetHeight - 50
      height: 430

  updateRendererSize: () =>
    @setSize()
    @camera.updateAspect(@size.width, @size.height)
    @camera.updateProjectionMatrix()
    @renderer.setSize( @size.width, @size.height )

  applyExtraHtml: () ->
    @canvas.style.backgroundImage = "url('resources/img/dev/background.png')";