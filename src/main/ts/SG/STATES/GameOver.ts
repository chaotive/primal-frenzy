export class GameOver extends Phaser.State {
    sprite: Phaser.Sprite;

    create() {
        this.game.add.sprite(0, 0, 'bg2');
        this.sprite = this.game.add.sprite(220, 80, 'chaotive');
        this.sprite.inputEnabled = true;
        this.sprite.events.onInputDown.add(this.action, this);
    }

    action() {
        this.game.state.start('Menu');
    }
}
