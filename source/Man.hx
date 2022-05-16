package;

import Shadow;
import flixel.FlxSprite;

class Man extends FlxSprite
{
    public var shadow : Shadow;

    public function new(x,y)
    {
        super(x,y);
        loadGraphic("assets/images/man.png", true, 16,16);
        scale.set(2,2);

        this.shadow = new Shadow(x, y - 30);
        //this.stamp(shadow, 100,100);
    }

    override public function update(elapsed:Float)
    {
    }
}

