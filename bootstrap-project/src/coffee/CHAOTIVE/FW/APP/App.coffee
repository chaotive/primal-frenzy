class CHAOTIVE.FW.APP.App

  constructor: (@configType, initCb = @start) ->
    @urlPrefix = switch @configType
      when 'dev' then "../src/resources/"
      else ""
    @configUrl = @urlPrefix + "config/" + @configType + ".json"
    @getJSON(@configUrl, (data) => @config = data; initCb())

  getJSON: (url, cb) ->
    xhttp = new XMLHttpRequest()
    xhttp.onreadystatechange = () ->
      if (@readyState == 4 and @status == 200) then cb(JSON.parse(@responseText))

    xhttp.open("GET", url, true)
    xhttp.send()
