console.log("Starting APP...");

function init(config) {
    try {
        console.log("Attempting start...");
        CHAOTIVE.UTIL.loadWhenCSAvailable(app, config);
        console.log("... application started! :)");
    } catch(err) {
        console.log("Still loading: " + err.message);
        setTimeout(init, 200, config);
    }
}

function app(config) {
    SAMPLE.app = new SAMPLE.PhaserGame(config);
}