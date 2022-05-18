package interactable;

import interactable.Interactable;
import flixel.FlxSprite;


/**
  Base class for anything that the player can interact with.
  **/
class Interactive extends FlxSprite
{
    public function new()
    {
        super();
        trace("Interactive Created");
        makeGraphic(50,50, flixel.util.FlxColor.GREEN);
    }
}
