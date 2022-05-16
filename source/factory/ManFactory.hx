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
            var x = Math.floor(Math.random() * 400);
            var y = Math.floor(Math.random() * 400);
            trace("---");
            trace(x,y);
            trace("---");
            var m = new Man(x,y);
            men.add(m);
        }
        return men;
    }
}
