package;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
  Simple HUD for the game showing basic information.
  **/
class HUD extends FlxTypedGroup<FlxSprite>
{
    public var zombieCount = 0;
    public var zombieText:FlxText;
    public var hasUpdated : Bool = false;

    public function new()
    {
        super();
        var str= this.zombieCount + "";
        this.zombieText = new flixel.text.FlxText(0,0, str, 11);
        zombieText.scrollFactor.set(0,0);
        add(zombieText);
    }

    override public function update(elapsed:Float)
    {
        //var str= this.zombieCount + "";
        //var zombieText = new flixel.text.FlxText(0,0, str, 11);
        //add(zombieText);

        if(!hasUpdated)
        {
            remove(zombieText);
            var str= this.zombieCount + "";
            this.zombieText = new flixel.text.FlxText(0,0, str, 11);
            add(zombieText);
        }

        hasUpdated = false;

    }
}
