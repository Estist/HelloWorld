package;
import flixel.addons.display.FlxNestedSprite;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import fx.Explosion;
/**
 * ...
 * @author Esti
 */
class Bullet extends FlxNestedSprite
{
	
	public var parent:Player;
	
	public function new() 
	{
		super();
		
		this.width = 5;
		this.height = 5;
			
		makeGraphic(5, 5, FlxColor.WHITE);
		
	}
	
	override public function destroy():Void 
	{
		super.destroy();
	}	
	
	public function init(x:Float,y:Float):Void
	{
		super.reset(x,y);
	}
	
	public function explode():Void
	{
		if (!alive)
			return;
		
		var explosion = new Explosion();
		explosion.init(this.getMidpoint().x - explosion.getMidpoint().x , this.getMidpoint().y - explosion.getMidpoint().y);
		explosion.scale.x = 0.3;
		explosion.scale.y = 0.3;
		Register.effectsGroup.add(explosion);
		
		this.kill();
	}

}