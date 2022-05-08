package bullet;

import flixel.addons.weapon.FlxBullet;
import flixel.util.FlxColor;

class BasicBullet extends FlxBullet
{
    public function new()
    {
        super();
        trace("Bullet Created");
        this.accelerates = true;
        this.xAcceleration = 10;
        this.yAcceleration = 10;
        makeGraphic(10,10, FlxColor.WHITE);
    }
}
