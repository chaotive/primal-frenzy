function start() {
    window.expect = chai.expect;
    window.should = chai.should();
    var runner = mocha.run();
}
