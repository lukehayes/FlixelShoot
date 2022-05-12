package;

import Player;
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

    override public function create()
    {
        super.create();

        this.text = new flixel.text.FlxText(0, 0, 0, "...", 32);
        this.text.screenCenter();
        add(this.text);

        this.player = new Player();
        add(this.player);

        //this.bullet = new BasicBullet();
        //add(this.bullet);

        this.bullets = new FlxTypedGroup<BasicBullet>();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if(Input.SHOOT())
        {
            var b = new BasicBullet(300,100);
            bullets.add(b);
        }

        player.update(elapsed);
    }
}
