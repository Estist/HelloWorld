package;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import utils.*;
import flixel.util.loaders.TexturePackerData;


/**
 * ...
 * @author Esti
 */
class Register
{
	//groups
	public static var effectsGroup:FlxGroup;
	public static var logicGroup:FlxGroup;
	public static var playersGroup:FlxGroup;
	public static var overFxGroup:FlxGroup;
	public static var uiGroup:FlxGroup;
	public static var objectsGroup:FlxGroup;
	public static var bulletGroup:FlxGroup;
	public static var powerUpPickablesGroup:FlxGroup;
	
	//settings vars
	public static var dashCooldown:Float = 1;
	public static var shieldCooldown:Float = 1;
	public static var shockCooldown:Float = 3;
	public static var AttackCooldown:Float = 0.3;
	
	//action duration
	public static var dashDuration:Float = 0.15;
	public static var shieldDuration:Float = 0.3;
	
	//level generic settings
	public static var startingLives:Int = 5;
	
	public static var texturePackerData:TexturePackerData;
	
	public static var winnerPlayer:String;

	
	//assets
	//public static var texture:TexturePackerData = new TexturePackerData("assets/data/spritesData.json", "assets/images/spritesheetTp.png");
	
}