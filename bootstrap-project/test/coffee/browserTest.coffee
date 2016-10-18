window.start = () ->
  window.expect = chai.expect
  window.should = chai.should()
  runner = mocha.run()
