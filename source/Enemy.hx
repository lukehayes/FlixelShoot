package;

import flixel.addons.weapon.FlxBullet;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.math.FlxAngle;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.text.FlxText;

class Enemy extends FlxSprite
{
    public var speed : Float = 100.0;
    public var damageText : FlxText;

    public function new(x:Float, y:Float)
    {
        super(x,y);
        makeGraphic(10,10, flixel.util.FlxColor.RED);
        health = 3;
        damageText = new FlxText(width / 2, (height / 2) - 20, "HIT", FlxColor.RED);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        //trace("Basic Bullet Updating");
        //this.x -= ((Math.random() * 100) * Math.cos(angle)) * elapsed;
        //this.y -= ((Math.random() * 100) * Math.sin(angle)) * elapsed;
    }


    override public function kill()
    {
        alive = false;
        FlxTween.tween(this.damageText, {alpha: 0, y: y - 16}, 0.33, {ease: FlxEase.circOut, onComplete: this.finishKill});
    }

    public function finishKill(_)
    {
        exists = false;
    }
}
