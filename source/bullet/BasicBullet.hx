package bullet;

import flixel.addons.weapon.FlxBullet;
import flixel.math.FlxAngle;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class BasicBullet extends FlxSprite
{
    public var speed  : Float = 1000.0;
    public var damage : Int = 1;
    //public var angle : Float = 0.0;

    public function new(x:Float, y:Float)
    {
        super(x,y);
        //this.accelerates = false;
        //this.xAcceleration = 1;
        //this.yAcceleration = 1;
        makeGraphic(4,4, flixel.util.FlxColor.WHITE);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        //trace("Basic Bullet Updating");
        this.x -= (speed * Math.cos(angle)) * elapsed;
        this.y -= (speed * Math.sin(angle)) * elapsed;
    }
}
