package;

import Player;
import Enemy;
import Man;
import flixel.math.FlxVelocity;
import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxTile;
import bullet.BasicBullet;
import weapon.BasicWeapon;
import flixel.input.mouse.FlxMouse;
import flixel.group.FlxGroup;
import dialogue.DialogueBox;


class PlayState extends FlxState
{
    var text       : flixel.text.FlxText;
    var player     : Player;
    var bullet     : BasicBullet;
    var weapon     : BasicWeapon;
    var mouse      : FlxMouse;
    var bullets    : FlxTypedGroup<BasicBullet>;
    var enemies    : FlxTypedGroup<Enemy>;
    var dialogeBox : DialogueBox;
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

        for(i in 0...100)
        {
            var rx = 100 + Math.random() * 500;
            var ry = 100 + Math.random() * 500;
            var e = new enemy.FaceGhoul(rx,ry);
            this.enemies.add(e);
        }
        add(this.enemies);

        this.dialogeBox = new DialogueBox();
        this.man = new Man(200,200);
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

        FlxG.overlap(this.player, this.enemies, function(p,s)
        {
            if(Input.UP())
            {
                add(this.dialogeBox);
            }
        });

        FlxG.overlap(this.player, this.enemies, function(p,s)
        {
            if(Input.DOWN())
            {
                remove(this.dialogeBox);
            }
        });

        FlxG.overlap(this.bullets, this.enemies, function(b,e)
        {
            b.kill();
            e.health -= b.damage;

            if(e.health < 0)
            {
                e.kill();
            }

        });

        player.update(elapsed);
    }
}
