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

    override public function create()
    {
        super.create();

        this.bullets = new FlxTypedGroup<BasicBullet>();
        add(this.bullets);

        this.player = new Player();
        add(this.player);

        this.enemies = new FlxTypedGroup<Enemy>();
        var e = new Enemy(400,400);

        for(i in 0...10)
        {
            var rx = 100 + Math.random() * 500;
            var ry = 100 + Math.random() * 500;
            var e = new enemy.FaceGhoul(rx,ry);
            this.enemies.add(e);
        }
        add(this.enemies);

        this.dialogeBox = new DialogueBox();
        this.man = new Man(200,200);
        this.man.animation.add("walk", [0,1], 3);
        add(this.man);


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


        FlxG.overlap(this.bullets, this.enemies, function(b,e)
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
