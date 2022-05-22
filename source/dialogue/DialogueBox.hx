package dialogue;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxSubState;
import flixel.util.FlxColor;

class DialogueBox extends FlxSprite
{
    public var text    : FlxText;

    public function new(text:String)
    {
        super();
        trace("Dialogue Box Created");

        makeGraphic(flixel.FlxG.width,100, FlxColor.BLACK);
        //y = flixel.FlxG.height - 10;

        this.text = new FlxText(text, 31);
        this.text.screenCenter();
        //this.text.y = this.graphic.y - 50;
        //add(this.text);
        stamp(this.text, 50, 10);
        this.scrollFactor.set(0,0);

        //makeGraphic(4,4, flixel.util.FlxColor.WHITE);
        //bgColor = FlxColor.PINK;
        //makeGraphic(200,200, FlxColor.PINK);


    }
}
