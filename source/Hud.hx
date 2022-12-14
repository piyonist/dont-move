import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;

class Hud extends FlxTypedGroup<FlxSprite>
{
	var scoreText:FlxText;

	public var score:Int = 0;

	public function new()
	{
		super();
		scoreText = new FlxText(575, 80, 0, "0", 72);
		add(scoreText);
	}

	public function incrementScore()
	{
		score++;
		scoreText.text = ' $score ';
	}
}
