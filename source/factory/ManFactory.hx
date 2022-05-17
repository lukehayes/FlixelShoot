package factory;

import flixel.group.FlxGroup;
import factory.Factory;
import Man;

class ManFactory extends Factory
{
    /**
      Create multiple instances of Man.
      @param Int    The amount of instances.
      @return FlxTypedGroup<Man>.
      **/
    public static function create(amount : Int) : FlxTypedGroup<Man>
    {
        var men = new FlxTypedGroup<Man>();

        for(i in 0...amount)
        {
            var x = 100 + Math.floor(Math.random() * 600);
            var y = 100 + Math.floor(Math.random() * 600);
            var m = new Man(x,y);
            men.add(m);
        }
        return men;
    }
}
