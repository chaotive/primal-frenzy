import {Util} from "../GAME/Util";

export class Menu extends Phaser.State {
    startButton: Phaser.Sprite;

    preload() {
        Util.preload(this.game);
    }

    create() {
        this.game.add.sprite(0, 0, 'bg1');
        this.startButton = this.game.add.sprite(230, 90, 'startbutton');
        this.startButton.inputEnabled = true;
        this.startButton.events.onInputDown.add(this.startAction,this);
    }

    startAction() { // action binded to startButton
        this.game.state.start('GameOver');
    }

}

