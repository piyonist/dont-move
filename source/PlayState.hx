package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import haxe.Timer;

class PlayState extends FlxState
{
	var player:Player;
	var skeletonLeft:Skeleton;
	var skeletonRight:Skeleton;
	var background:FlxSprite;

	public static var hud:Hud;

	public static var gameSave:FlxSave;

	var timer:Timer;

	override public function create()
	{
		// SCORE SAVE
		gameSave = new FlxSave();
		gameSave.bind("bestScore");
		// BACKGROUND
		background = new FlxSprite(0, 0);
		background.loadGraphic("assets/images/background.png", false, 1280, 720);
		add(background);
		// PLAYER
		player = new Player(580, 390);
		add(player);
		// SKELETON LEFT
		skeletonLeft = new Skeleton(-113, 320);
		skeletonLeft.offset.set(-250, -85);
		add(skeletonLeft);
		// SKELETON RIGHT
		skeletonRight = new Skeleton(1130, 320);
		skeletonRight.flipX = true;
		add(skeletonRight);
		// HUD
		hud = new Hud();
		add(hud);
		// SCORE INCREMENT
		timer = new Timer(1000);
		timer.run = function()
		{
			hud.incrementScore();
		}
		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.overlap(player, skeletonLeft))
		{
			player.isDead = true;
			skeletonLeft.animation.play("attack", false);
			player.velocity.x = 0;
		}
		else
		{
			skeletonLeft.animation.play("idle");
		}

		if (FlxG.overlap(player, skeletonRight))
		{
			player.isDead = true;
			skeletonRight.animation.play("attack");
			player.velocity.x = 0;
		}
		else
		{
			skeletonRight.animation.play("idle");
		}

		super.update(elapsed);

		if (player.isDead)
		{
			timer.stop();
			FlxG.camera.fade(FlxColor.BLACK, 1.6, false, doneFadeOut);
			if (gameSave.data.bestScore == null || hud.score > gameSave.data.bestScore)
			{
				gameSave.data.bestScore = hud.score;
				gameSave.flush();
			}
		}
	}

	function doneFadeOut()
	{
		FlxG.switchState(new GameOverState());
	}
}
