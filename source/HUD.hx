package;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
  Simple HUD for the game showing basic information.
  **/
class HUD extends FlxTypedGroup<FlxSprite>
{
    public var zombieCount = 0;
    public var zombieText  = 0;

    public function new()
    {
        super();
        var zombieText = new flixel.text.FlxText(0,0, "ZombieCount", 16);
        zombieText.scrollFactor.set(0,0);
        add(zombieText);
    }
}
