package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
    var game : FlxGame = null;

    public function new()
    {
        super();
        this.game = new FlxGame(0,0, PlayState, 1, 60, 60, true);
        addChild(game);
    }
}
