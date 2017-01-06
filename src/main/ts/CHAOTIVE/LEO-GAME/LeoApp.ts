import {LeoGame} from "./LeoGame";

export class LeoApp extends CHAOTIVE.FW.APP.App {
    game: LeoGame;

    constructor(configType = "main") {
        super(configType, () => this.start());
        console.log("LeoApp started: " + configType);
    }

    start() {
        this.game = new LeoGame(this);
    }
}