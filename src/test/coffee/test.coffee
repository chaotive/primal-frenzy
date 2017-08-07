should = require('chai').should()

global.Phaser = require('phaser-mock')
require '../../../target/lib/chaotive.fw-0.5.0'

global.SOMEGAME = require '../../../target/js/some-game'

require './SG/some.spec.coffee'
