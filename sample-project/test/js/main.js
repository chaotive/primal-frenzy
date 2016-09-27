console.log("Starting test suite...");

function init() {
    try {
        console.log("Attempting start...");
        CHAOTIVE.UTIL.loadWhenCSAvailable(testMocha);
        console.log("... application started! :)");
    } catch(err) {
        console.log("Still loading: " + err.message);
        setTimeout(init, 200);
    }
}

function testMocha() {
    window.expect = chai.expect;
    window.should = chai.should();
    var runner = mocha.run();
}
