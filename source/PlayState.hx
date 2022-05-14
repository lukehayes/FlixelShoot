package;

import Player;
import Enemy;
import flixel.math.FlxVelocity;
import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxTile;
import bullet.BasicBullet;
import weapon.BasicWeapon;
import flixel.input.mouse.FlxMouse;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
    var text   : flixel.text.FlxText;
    var player : Player;
    var bullet : BasicBullet;
    var weapon : BasicWeapon;
    var mouse  : FlxMouse;
    var bullets: FlxTypedGroup<BasicBullet>;
    var enemies: FlxTypedGroup<Enemy>;

    override public function create()
    {
        super.create();

        this.text = new flixel.text.FlxText(0, 0, 0, "Btx", 32);
        this.text.screenCenter();
        add(this.text);

        this.player = new Player();
        add(this.player);

        //this.bullet = new BasicBullet(10,10);
        //add(this.bullet);

        this.bullets = new FlxTypedGroup<BasicBullet>();
        add(this.bullets);

        this.enemies = new FlxTypedGroup<Enemy>();
        var e = new Enemy(400,400);

        for(i in 0...100)
        {
            var rx = Math.random() * 500;
            var ry = Math.random() * 500;
            var e = new Enemy(rx,ry);
            this.enemies.add(e);
        }
        add(this.enemies);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if(Input.SHOOT())
        {
            var angle = Math.atan2(player.y - FlxG.mouse.y, player.x - FlxG.mouse.x);
            var b = new BasicBullet(player.x, player.y);
            b.angle = angle;
            bullets.add(b);
        }

        FlxG.overlap(this.bullets, this.enemies, function(b,s)
                {
                    s.kill();
                    //FlxG.camera.shake(0.01,0.01);
                    //FlxG.camera.flash();

                });

        player.update(elapsed);
    }
}
