import {Menu} from "./STATES/Menu"
import {GameOver} from "./STATES/GameOver";

export class Game extends Phaser.Game {
    app: CHAOTIVE.FW.APP.App;

    constructor(app) {
        super(640, 360, Phaser.AUTO, "game");

        this.app = app;

        this.state.add('Menu', Menu, false);
        this.state.add('GameOver', GameOver, false);
        this.state.start('Menu');

        console.log("Game started...");
    }
}