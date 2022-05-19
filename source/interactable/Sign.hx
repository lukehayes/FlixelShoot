package interactable;

import interactable.Interactable;
import interactable.Interactive;
import dialogue.DialogueBox;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;

typedef FL = flixel.FlxG;

class Sign extends Interactive implements Interactable
{
    var text : String;
    var db   : DialogueBox;

    public function new(text:String)
    {
        super();
        trace("Sign Created");
        makeGraphic(100,100, flixel.util.FlxColor.RED);
        this.text = text;
        var db = new DialogueBox(text);
        //flixel.FlxG.state.add(this.db);
    }

    public function interact(state:FlxState) : Void
    {
        FL.state.add(this.db);
        trace(this.db.text);
    }
}
