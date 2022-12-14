package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

// import openfl.events.KeyboardEvent;
class GameOverState extends FlxState
{
	var bestScore = PlayState.gameSave.data.bestScore;
	var currentScore = PlayState.hud.score;

	override public function create()
	{
		var gameOverText = new flixel.text.FlxText(425, 100, "game over", 64);
		// gameOverText.screenCenter();
		add(gameOverText);

		var scoreText = new flixel.text.FlxText(600, 200, '$currentScore', 64);
		add(scoreText);
		/*
			var bestScoreText = new flixel.text.FlxText(300, 300, "best: ", 64);
			bestScoreText.setFormat(null, 64, FlxColor.RED);
			add(bestScoreText);
		 */
		var bestScore = new flixel.text.FlxText(600, 300, '$bestScore', 64);
		bestScore.setFormat(null, 64, FlxColor.RED);
		add(bestScore);

		var restartText = new flixel.text.FlxText(495, 400, "press anywhere to restart", 16);
		add(restartText);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		restartGame();
		super.update(elapsed);
	}

	function restartGame()
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
