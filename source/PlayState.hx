package;

import Player;
import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxTile;

class PlayState extends FlxState
{
    var text   : flixel.text.FlxText;
    var player : Player;

    override public function create()
    {
        super.create();

        this.text = new flixel.text.FlxText(0, 0, 0, "Shoot Things!", 32);
        this.text.screenCenter();
        add(this.text);

        this.player = new Player();
        add(this.player);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        player.update(elapsed);
    }
}
