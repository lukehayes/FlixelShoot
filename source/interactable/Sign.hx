package interactable;

import interactable.Interactable;
import interactable.Interactive;
import flixel.FlxSprite;

class Sign extends Interactive implements Interactable
{
    var text : String;

    public function new(text:String)
    {
        super();
        trace("Sign Created");
        this.text = text;
    }

    public function interact() : Void
    {
        trace(this.text);
    }
}
