class CHAOTIVE.THREE.Preload

  constructor: (cb) ->
    THREE.loader = {}
    @manager = new THREE.LoadingManager()
    @manager.onLoad = cb
    @loader = new THREE.TextureLoader(@manager);

  load: (ress, group) ->
    for id, url of ress
      console.log(id + " ...")
      @loadResource(id , url, group)

  loadResource: (id, url, group) ->
    THREE.loader[group] = {}
    @loader.load(
      url,
      (res) =>
        console.log("... " + url)
        THREE.loader[group][id] = res
    )
