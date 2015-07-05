package;

import flash.display.BlendMode;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Tembac
 */
class Ligth extends FlxSprite
{
	
	public var ligthColor:Int;
	
	public var lamp:FlxSprite;
	public var level:Level1;
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y); 
	}
	
	public function setupLigth(X:Float=0, Y:Float=0, SimpleGraphic:String):Void
	{
		loadGraphic(SimpleGraphic);
		//ligthColor = FlxColor.YELLOW;
		set_blend(BlendMode.SCREEN);
	}
	
	public function startLigth(?base_alpha:Float = 0.6, ?alpha_flicker:Float = 0.2):Void
	{
		FlxTween.color(this, 2, ligthColor, ligthColor, base_alpha, base_alpha + alpha_flicker, { type:FlxTween.PINGPONG , ease:FlxEase.elasticInOut});
	}
	
	
	override public function update():Void
	{
		super.update();
	}
	
	override public function draw():Void
	{
		if (alpha == 0
		|| !isOnScreen() )
		{
			return;
		}
		var ScreenXY = this.getScreenXY();
		//this.level.levelSprt.stamp(this, Std.int(ScreenXY.x) , Std.int(ScreenXY.y));
		MenuState.darknessCanvas.stamp(this, Std.int(ScreenXY.x) , Std.int(ScreenXY.y));
	}
}