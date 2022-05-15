package dialogue;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxSubState;
import flixel.util.FlxColor;

class DialogueBox extends FlxSubState
{
    public var graphic : FlxSprite;
    public var text    : FlxText;

    public function new()
    {
        super();
        trace("Dialogue Box Created");

        this.graphic = new FlxSprite().makeGraphic(flixel.FlxG.width,100, FlxColor.GREEN);
        this.graphic.y = flixel.FlxG.height - 10;
        add(this.graphic);

        this.text = new FlxText("I am the dialogue box!", 21);
        this.text.screenCenter();
        this.text.y = this.graphic.y - 50;
        add(this.text);

        //makeGraphic(4,4, flixel.util.FlxColor.WHITE);
        //bgColor = FlxColor.PINK;
        //makeGraphic(200,200, FlxColor.PINK);


    }
}
