package;
import flixel.addons.display.FlxNestedSprite;
import flixel.util.FlxPoint;
import flixel.util.loaders.TexturePackerData;

class MagnetPowerUp extends Item
{	
	public function new() 
	{
		super();
		
		var t:TexturePackerData = Register.texturePackerData;
		this.loadGraphicFromTexture(t);
		this.animation.addByPrefix("idle", "magnet_main_0008", 30, false);
		
		this.width = 30;
		this.height = 30;
		
		this.animation.play("idle");
		//this.scale.set(0.3, 0,3);
		this.scale.x = 0.4;
		this.scale.y = 0.4;
		this.updateHitbox();
		//this.antialiasing = true;
		
	}
	
	override public function init(x:Float,y:Float):Void
	{
		super.reset(x, y);
		this.animation.play("idle");	
	}
	
	override public function release(player:Player):Void
	{
		var magnet:Magnet = new Magnet();
		//var pos:FlxPoint = new FlxPoint(500, 170);
		var pos:FlxPoint = new FlxPoint (Utils.findMidPointForObject(magnet,player).x ,Utils.findMidPointForObject(magnet,player).y - 200);
		magnet.init(pos);
		Register.objectsGroup.add(magnet);
		
		this.kill();
	}
}