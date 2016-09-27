/**
 * Created by leo on 12-11-2015.
 */
console.log("Starting APP...");

function init(config) {
    try {
        console.log("Attempting start...");
        CHAOTIVE.UTIL.loadWhenCSAvailable(game, config);
        console.log("... application started! :)");
    } catch(err) {
        console.log("Still loading: " + err.message);
        setTimeout(init, 200, config);
    }
}

function game(config) {
    DEC.game = new DEC.DemonsEdge(config);
}