package enemy;

class FaceGhoul extends Enemy
{
    public function new(x,y)
    {
        super(x,y);
        makeGraphic(10,10, flixel.util.FlxColor.RED);
        var img = loadGraphic("assets/images/FaceGhoul.png", false, 32,32);
        //img.scale(10);
    }
}
