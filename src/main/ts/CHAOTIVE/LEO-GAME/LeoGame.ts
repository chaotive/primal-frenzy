import {Menu} from "./STATES/Menu"

export class LeoGame extends CHAOTIVE.FW.APP.App {
    game: Phaser.Game;

    constructor(configType = "main") {
        console.log("Welcome to a Sample Phaser Game project: " + configType);
        super(configType, () => this.start())
    }

    start() {
        this.game = new Phaser.Game(640, 360, Phaser.AUTO, "game");

        console.log(Menu);
        // this.game.state.add('menu', Menu, false);
        // this.game.state.add('gameover', SAMPLE.STATES.GameOver, false);
        // this.game.state.start('menu');
        console.log("started...");
    }
}