package interactable;

import flixel.FlxState;

/**
  Interface for anything that the player can interact with.
  **/
interface Interactable
{
    /**
      Trigger the interaction, show dialoge etc.
      @return void
      **/
    public function interact(state:FlxState) : Void;
}
