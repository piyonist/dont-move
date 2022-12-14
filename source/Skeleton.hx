package;

import flixel.FlxG;
import flixel.FlxSprite;

class Skeleton extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		loadGraphic("assets/images/skeleton.png", true, 43, 37);
		scale.set(6, 6);
		updateHitbox();
		offset.set(30, -85);
		animation.add("idle", [18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28], 13, false);
		animation.add("attack", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 13, false);
		immovable = true;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
