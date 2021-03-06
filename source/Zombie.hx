package;

import Shadow;
import flixel.FlxSprite;

class Zombie extends FlxSprite
{
    public var shadow : Shadow;
    public var speed : Int = 100;

    public function new(x,y)
    {
        super(x,y);
        loadGraphic("assets/images/zombie.png", true, 16,16);
        scale.set(2,2);

        this.shadow = new Shadow(x, y - 30);
        //this.stamp(shadow, 100,100);

        health = 10;
    }

    override public function update(elapsed:Float)
    {
        this.x += speed * Math.cos(angle) * elapsed;
        this.y += speed * Math.sin(angle) * elapsed;
    }
}

