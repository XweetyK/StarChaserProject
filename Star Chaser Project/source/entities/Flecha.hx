package entities;
import flixel.FlxSprite;
import flixel.math.FlxRandom;

/**
 * ...
 * @author Leo Perugini
 */
class Flecha extends FlxSprite
{
	public var wFlecha(get, null):Int;
	private var r:FlxRandom;
	private var rUp:Int;
	private var rDown:Int;
	private var rLeft:Int;
	private var rRight:Int;
	public function new(WFlecha:Int)
	{
		super();
		wFlecha = WFlecha;
		makeGraphic(30, 30);
		updateHitbox();
		
		r = new FlxRandom();
		rUp = 0;
		rDown = 0;
		rLeft = 0;
		rRight = 0;
		
		switch (wFlecha)
		{
			case 0:
				//RIGHT----------
				velocity.x = 240;
				rRight = r.int(100,400);
				this.x = 990;
				this.y = rRight;
			case 1:
				//LEFT-----------
				velocity.x = -240;
				rLeft = r.int(200, 500);
				this.x = 209;
				this.y = rLeft;
			case 2:
				//DOWN-----------
				velocity.y = 240;
				rDown = r.int(100, 450);
				this.x = rDown;
				this.y = 410;
			case 3:
				//UP-------------
				velocity.y = -240;
				rUp = r.int(750, 1000);
				this.x = rUp;
				this.y = 209;
		}
	}
	public function get_wFlecha():Int
	{
		return wFlecha;
	}
}