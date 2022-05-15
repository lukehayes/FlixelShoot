package;

import flixel.addons.weapon.FlxBullet;
import flixel.math.FlxAngle;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Enemy extends FlxSprite
{
    public var speed : Float = 100.0;
    //public var angle : Float = 0.0;

    public function new(x:Float, y:Float)
    {
        super(x,y);
        makeGraphic(10,10, flixel.util.FlxColor.RED);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        //trace("Basic Bullet Updating");
        //this.x -= (speed * Math.cos(angle)) * elapsed;
        //this.y -= (speed * Math.sin(angle)) * elapsed;
    }
}
