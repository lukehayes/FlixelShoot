package;

import flixel.FlxSprite;

class Man extends FlxSprite
{
    public function new(x,y)
    {
        super(x,y);
        loadGraphic("assets/images/man.png", true, 16,16);
        scale.set(3,3);
    }
}

