package;
import flixel.FlxSprite;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Esti
 */
class Utils
{	
	public static function findMidPointForObject( sprite:FlxSprite , anotherSprite:FlxSprite):FlxPoint
	{
		return new FlxPoint(anotherSprite.getMidpoint().x - sprite.getMidpoint().x , anotherSprite.getMidpoint().y - sprite.getMidpoint().y);
	}
	
	public static function findMidLowerPointForObject( sprite:FlxSprite, anotherSprite:FlxSprite):FlxPoint
	{
		return new FlxPoint(anotherSprite.getMidpoint().x - sprite.getMidpoint().x , anotherSprite.getMidpoint().y - sprite.getMidpoint().y  + (anotherSprite.height-sprite.height)/2);
	}
	
	public static function findMidRightPointForObject( sprite:FlxSprite, anotherSprite:FlxSprite):FlxPoint
	{
		return new FlxPoint(anotherSprite.getMidpoint().x - sprite.getMidpoint().x + (anotherSprite.width - sprite.width)/2 , anotherSprite.getMidpoint().y - sprite.getMidpoint().y);
	}
	
	public static function findMidLeftPointForObject( sprite:FlxSprite, anotherSprite:FlxSprite):FlxPoint
	{
		return new FlxPoint(anotherSprite.getMidpoint().x - sprite.getMidpoint().x - (anotherSprite.width - sprite.width)/2 , anotherSprite.getMidpoint().y - sprite.getMidpoint().y);
	}
	
}