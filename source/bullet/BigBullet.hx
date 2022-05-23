package bullet;

import flixel.addons.weapon.FlxBullet;
import flixel.math.FlxAngle;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class BigBullet extends BasicBullet
{
    public function new(x:Float, y:Float)
    {
        super(x,y);
        //this.accelerates = false;
        //this.xAcceleration = 1;
        //this.yAcceleration = 1;
        makeGraphic(8,8, flixel.util.FlxColor.PURPLE);
        damage = 3;
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        //trace("Basic Bullet Updating");
        this.x -= (speed * Math.cos(angle)) * elapsed;
        this.y -= (speed * Math.sin(angle)) * elapsed;

        updateLifetime(elapsed);
    }
}
