package;

import flixel.FlxSprite;

class Man extends FlxSprite
{
    public function new(x,y)
    {
        super(x,y);
        loadGraphic("assets/images/man.png", false, 32,32);
    }
}

