package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Shadow extends FlxSprite
{
    public function new(x,y)
    {
        super(x,y);
        //makeGraphic(16,4, FlxColor.fromRGB(100,100,100,255));
        makeGraphic(16,4, FlxColor.BLACK);
    }
}
