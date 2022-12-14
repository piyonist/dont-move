package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{
	var playButton:FlxButton;

	override public function create()
	{
		var text = new flixel.text.FlxText(0, 0, "keep the character balanced by pressing \n        the right and left of the screen", 32);
		text.screenCenter();
		add(text);

		var startText = new flixel.text.FlxText(495, 600, "press anywhere to start", 16);
		add(startText);
	}

	override public function update(elapsed:Float)
	{
		startGame();
		super.update(elapsed);
	}

	function startGame()
	{
		var isPressed:Bool = false;
		// FlxG.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownsevent -> FlxG.switchState(new PlayState()));
		isPressed = FlxG.keys.anyPressed([
			Q, W, E, R, T, Y, U, I, O, P, A, S, D, F, G, H, J, K, L, Z, X, C, V, B, N, M, SPACE, CONTROL, SHIFT, ALT, ENTER, LEFT, RIGHT, UP, DOWN, 1, 2, 3,
			4, 5, 6, 7, 8, 9, 0
		]);

		if (isPressed)
		{
			FlxG.switchState(new PlayState());
		}
	}
}
