package factory;

import flixel.group.FlxGroup;
import factory.Factory;
import Zombie;

class ZombieFactory extends Factory
{
    /**
      Create multiple instances of Zombie.
      @param Int    The amount of instances.
      @return FlxTypedGroup<Zombie>.
      **/
    public static function create(amount : Int) : FlxTypedGroup<Zombie>
    {
        var zombies = new FlxTypedGroup<Zombie>();

        for(i in 0...amount)
        {
            var x = 100 + Math.floor(Math.random() * 600);
            var y = 100 + Math.floor(Math.random() * 600);
            var z = new Zombie(x,y);
            z.animation.add("walk", [0,1], 3);
            zombies.add(z);
        }
        return zombies;
    }
}
