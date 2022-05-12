package bullet;

import flixel.addons.weapon.FlxBullet;
import flixel.math.FlxAngle;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class BasicBullet extends FlxSprite
{
    public var speed : Float = 100.0;

    public function new(x:Float, y:Float)
    {
        super(x,y);
        trace("Bullet Created");
        //this.accelerates = false;
        //this.xAcceleration = 1;
        //this.yAcceleration = 1;
        makeGraphic(40,40, flixel.util.FlxColor.WHITE);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        trace("Basic Bullet Updating");
    }
}
