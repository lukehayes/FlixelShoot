package;

import Player;
import Enemy;
import Man;
import flixel.FlxG;
import flixel.FlxState;
import bullet.Bullet;
import bullet.BasicBullet;
import bullet.BigBullet;
import weapon.BasicWeapon;
import flixel.input.mouse.FlxMouse;
import flixel.group.FlxGroup;
import factory.ManFactory;
import factory.ZombieFactory;
import dialogue.DialogueBox;
import interactable.Interactable;
import interactable.Interactive;
import interactable.Sign;

class PlayState extends FlxState
{
    var text       : flixel.text.FlxText;
    var player     : Player;
    var bullet     : BasicBullet;
    var weapon     : BasicWeapon;
    var mouse      : FlxMouse;
    var bullets    : FlxTypedGroup<BigBullet>;
    var enemies    : FlxTypedGroup<Enemy>;
    var man        : Man;
    var factory    : FlxTypedGroup<Zombie>;
    var interacts  : FlxTypedGroup<Interactive>;
    var db         : DialogueBox;

    override public function create()
    {
        super.create();

        flixel.system.FlxAssets.FONT_DEFAULT = "assets/fonts/cozette_bitmap.ttf";
        bgColor = flixel.util.FlxColor.GRAY;

        this.bullets = new FlxTypedGroup<BigBullet>();
        add(this.bullets);

        this.player = new Player();
        add(this.player);
        FlxG.camera.follow(this.player, TOPDOWN);


        this.factory = ZombieFactory.create(30);
        add(this.factory);

        this.interacts = new FlxTypedGroup<Interactive>();
        var s1 = new Sign("A test sign");
        s1.x = Math.random() * 300;
        s1.y = Math.random() * 300;
        var s2 = new Sign("HI");
        s2.x = Math.random() * 300;
        s2.y = Math.random() * 300;
        var s3 = new Sign("Damn this is a lovely sign");
        s3.x = Math.random() * 300;
        s3.y = Math.random() * 300;
        this.interacts.add(s1);
        this.interacts.add(s2);
        this.interacts.add(s3);
        this.add(interacts);

        FlxG.mouse.load("assets/images/Crosshair.png",4,-9,-9);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        FlxG.overlap(this.player, this.interacts, function(p,s){
            
            if(Input.UP())
                s.interact();
        });

        if(Input.SHOOT())
        {
            var angle = Math.atan2(player.y - FlxG.mouse.y, player.x - FlxG.mouse.x);
            var b = new BigBullet(player.x + 8, player.y + 8);
            b.angle = angle;
            bullets.add(b);
        }

        this.factory.forEachAlive(function(z)
        {
            z.angle = Math.atan2(this.player.y - z.y, this.player.x - z.x);
        });


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
