(function() {
  var top;

  top = typeof exports !== 'undefined' ? global : window;

  top.bundle = function(_arg) {
    var k, namespaces, organization, v, _results;
    organization = _arg.organization, namespaces = _arg.namespaces;
    if (top[organization] == null) {
      top[organization] = {};
    }
    _results = [];
    for (k in namespaces) {
      v = namespaces[k];
      _results.push(top[organization][k] = v);
    }
    return _results;
  };

  top.initRendering = function() {
    var err;
    try {
      console.log("Attempting start...");
      CHAOTIVE.FW.UTIL.loadWhenCSAvailable(start);
      return console.log("... application started! :)");
    } catch (_error) {
      err = _error;
      console.log("Still loading: " + err.message);
      return setTimeout(initRendering, 200);
    }
  };

  top.init = function() {
    if (typeof chfwSettings === "undefined" || chfwSettings === null) {
      top.chfwSettings = {};
    }
    return initRendering();
  };

  init();

  bundle({
    organization: "CHAOTIVE",
    namespaces: {
      FW: {
        APP: {},
        UTIL: {}
      }
    }
  });

  CHAOTIVE.FW.APP.App = (function() {
    function App(configType, initCb) {
      var _this = this;
      this.configType = configType;
      if (initCb == null) {
        initCb = this.start;
      }
      this.urlPrefix = (function() {
        switch (this.configType) {
          case 'dev':
            return "../../main/resources/";
          default:
            return "";
        }
      }).call(this);
      this.configUrl = this.urlPrefix + "config/" + this.configType + ".json";
      this.getJSON(this.configUrl, function(data) {
        _this.config = data;
        return initCb();
      });
    }

    App.prototype.getJSON = function(url, cb) {
      var xhttp;
      xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
          return cb(JSON.parse(this.responseText));
        }
      };
      xhttp.open("GET", url, true);
      return xhttp.send();
    };

    return App;

  })();

  CHAOTIVE.FW.APP.fullscreen = {
    enter: function(c) {
      if (c.requestFullscreen) {
        c.requestFullscreen();
      }
      if (c.webkitRequestFullscreen) {
        c.webkitRequestFullscreen();
      }
      if (c.mozRequestFullScreen) {
        c.mozRequestFullScreen();
      }
      if (c.msRequestFullscreen) {
        return c.msRequestFullscreen();
      }
    },
    exit: function() {
      if (document.exitFullscreen) {
        document.exitFullscreen();
      }
      if (document.msExitFullscreen) {
        document.msExitFullscreen();
      }
      if (document.mozCancelFullScreen) {
        document.mozCancelFullScreen();
      }
      if (document.webkitExitFullscreen) {
        return document.webkitExitFullscreen();
      }
    }
  };

  CHAOTIVE.FW.UTIL.Random = (function() {
    function Random() {}

    Random.number = function(max, min) {
      if (min == null) {
        min = 0;
      }
      return Math.floor(Math.random() * (max - min) + min);
    };

    return Random;

  })();

  CHAOTIVE.FW.UTIL.loadWhenCSAvailable = function(f, p) {
    return f(p);
  };

}).call(this);
