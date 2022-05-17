package;

import Player;
import Enemy;
import Man;
import flixel.FlxG;
import flixel.FlxState;
import bullet.BasicBullet;
import weapon.BasicWeapon;
import flixel.input.mouse.FlxMouse;
import flixel.group.FlxGroup;
import factory.ManFactory;

class PlayState extends FlxState
{
    var text       : flixel.text.FlxText;
    var player     : Player;
    var bullet     : BasicBullet;
    var weapon     : BasicWeapon;
    var mouse      : FlxMouse;
    var bullets    : FlxTypedGroup<BasicBullet>;
    var enemies    : FlxTypedGroup<Enemy>;
    var man        : Man;
    var factory    : FlxTypedGroup<Man>;

    override public function create()
    {
        super.create();

        bgColor = flixel.util.FlxColor.GRAY;

        this.bullets = new FlxTypedGroup<BasicBullet>();
        add(this.bullets);

        this.player = new Player();
        add(this.player);


        this.factory = ManFactory.create(30);
        add(this.factory);

        FlxG.mouse.load("assets/images/Crosshair.png",4,-9,-9);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if(Input.SHOOT())
        {
            var angle = Math.atan2(player.y - FlxG.mouse.y, player.x - FlxG.mouse.x);
            var b = new BasicBullet(player.x + 8, player.y + 8);
            b.angle = angle;
            bullets.add(b);
        }


        FlxG.overlap(this.bullets, this.factory, function(b,e)
        {
            var damageString = "-" + b.damage;
            var damageText = new flixel.text.FlxText(e.x, e.y - 16,0, damageString, 16);
            damageText.color = flixel.util.FlxColor.fromRGB(220,50,35,255);
            add(damageText);
            flixel.tweens.FlxTween.tween(damageText, {alpha: 0, y: e.y - 64}, 2, {ease: flixel.tweens.FlxEase.circOut});
            b.kill();
            e.hurt(b.damage);
        });

        player.update(elapsed);
    }
}
