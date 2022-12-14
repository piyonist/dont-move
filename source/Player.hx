package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxRandom;
import haxe.Timer;

class Player extends FlxSprite
{
	var speed:Float = 2000;
	var aiSpeed:Float = 4500;
	var random:FlxRandom;
	var sol:Bool;
	var timer:Timer;
	var currentScore:Int;

	public var isDead:Bool = false;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		random = new FlxRandom();
		//	player.loadGraphic(AssetPaths.player__png, true, 32, 47);
		loadGraphic("assets/images/player.png", true, 32, 48);
		scale.set(3.5, 3.5);
		updateHitbox();
		setFacingFlip(RIGHT, false, false);
		setFacingFlip(LEFT, true, false);
		animation.add("walk", [0, 1, 2, 3, 4, 5], 24, false);
		animation.add("stop", [2], 24, false);
		drag.x = drag.y = 1600;
		// TIMER
		timer = new Timer(50);
		timer.run = function()
		{
			if (currentScore < 56)
			{
				switch (currentScore)
				{
					case 5:
						aiSpeed = 5000;
					// speed = 3500;
					case 15:
						aiSpeed = 5300;
					// speed = 3800;
					case 25:
						aiSpeed = 5600;
					// speed = 4100;
					case 35:
						aiSpeed = 5700;
					// speed = 4200;
					case 45:
						aiSpeed = 5800;
					// speed = 4300;
					case 55:
						aiSpeed = 6000;
					// speed = 4500;
					default:
						aiSpeed = 4500;
						// speed = 3000;
				}
			}
			randomMovement();
		}
	}

	function randomMovement()
	{
		if (isDead == false)
		{
			sol = random.bool(50);
			if (sol == true)
			{
				acceleration.set(-aiSpeed, 0);
			}
			if (sol == false)
			{
				acceleration.set(aiSpeed, 0);
			}
		}
	}

	function updateMovement()
	{
		var left:Bool = false;
		var right:Bool = false;

		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);

		if (left && right)
		{
			left = right = false;
		}

		if (right && (isDead == false))
		{
			acceleration.set(speed, 0);
			facing = RIGHT;
		}

		if (left && (isDead == false))
		{
			acceleration.set(-speed, 0);
			facing = LEFT;
		}

		if ((velocity.x != 0) && touching == NONE && (left || right))
		{
			animation.play("walk");
		}

		if (velocity.x == 0)
		{
			animation.play("stop");
		}
	}

	override function update(elapsed:Float)
	{
		if (isDead)
		{
			timer.stop();
			velocity.set(0, 0);
			acceleration.set(0, 0);
		}
		currentScore = PlayState.hud.score;
		updateMovement();
		super.update(elapsed);
	}
}
