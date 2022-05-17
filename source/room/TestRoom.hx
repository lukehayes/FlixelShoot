package room;

import room.Room;
import Player;

class TestRoom extends Room
{
    public var player : Player;

    public function new()
    {
        super();
        this.player = new Player();
        this.add(this.player);
    }

    override public function update(elapsed:Float)
    {
        player.update(elapsed);
    }
}
