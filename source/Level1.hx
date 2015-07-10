package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel .*;
import flixel.tile.FlxTilemap;
import flixel.util.FlxPoint;
import openfl.Assets;
import openfl.display.BlendMode;
/**
 * ...
 * @author Esti
 */
class Level1 extends FlxGroup
{
	public var fondoSprt:FlxSprite;		
	public var levelSprt:FlxSprite;		
	public var overPlatFormsLight:FlxSprite;		
	public var overLightsSprt:FlxSprite;		
	public var blackBorder:FlxSprite;		
	public var map:FlxTilemap;
	public var width:Float;
	public var height:Float;

	public function new() 
	{
		super();
		this.fondoSprt = new FlxSprite(0 , 0, "assets/images/2.png");
		this.fondoSprt.solid = false;
		this.fondoSprt.scrollFactor.set(0.5,0.5);
		
		this.blackBorder = new FlxSprite(-642 , -360, "assets/images/marco.png");
		this.blackBorder.solid = false;
			
		this.levelSprt = new FlxSprite(0 , 0, "assets/images/1.png");
		this.levelSprt.solid = false;
		//this.levelSprt.blend = BlendMode.MULTIPLY;
		
		this.overLightsSprt = new FlxSprite(0 , 0, "assets/images/char_light.png");
		this.overLightsSprt.solid = false;
		this.overLightsSprt.blend =  BlendMode.HARDLIGHT;
		
		this.overPlatFormsLight = new FlxSprite(0 , 0, "assets/images/scene_light_blue.png");
		this.overPlatFormsLight.solid = false;
		//this.overPlatFormsLight.blend =  BlendMode.HARDLIGHT;
		
		this.map = new FlxTilemap();
		this.map.loadMap(Assets.getText("assets/data/mapcsv_group1_map1.csv"), "assets/images/tile01.png", 45, 45, 0, 0, 1, 1);
		this.map.visible = false;

		this.width = map.width;
		this.height = map.height ;
		
		add(this.fondoSprt);
		add(levelSprt);
		//add(blackBorder);
		//add(overPlatFormsLight);
		Register.overFxGroup.add(this.overLightsSprt);
		add(map);
	}
	
}