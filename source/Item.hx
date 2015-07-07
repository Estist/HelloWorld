package;
import flixel.addons.display.FlxNestedSprite;
import flixel.util.loaders.TexturePackerData;


/**
 * ...
 * @author Esti
 */
class Item extends FlxNestedSprite
{
	public var pickedUp:Bool = false;
	public var parent:Player;
	public var canBePicked:Bool = true;

	override public function destroy():Void 
	{
		super.destroy();
	}
	
	public function init(x:Float, y:Float ):Void
	{
		
	}
	
	public function release(player:Player):Void
	{
		
	}
	
	public function pickUp(parent:Player):Void
	{
		this.pickedUp = true;
		this.parent = parent;
	}
	
	public function teleportIfOutOfBounds():Void
	{
		if(this.y >= 1001)
			this.setPosition(this.x, - 1);
			
		if (this.y <= -2)
			this.setPosition(this.x, 1000);
			
		if(this.x >= 1766)
			this.setPosition(150 ,this.y);
			
		if (this.x <= 149)
			this.setPosition(1765 , this.y);
	}
	
	override public function update():Void
	{			
		super.update();
		
		acceleration.x = 0;
		
		if (pickedUp)
		{
			if (parent != null)
			{
				this.x = parent.x + 10;
				this.y = parent.y - 50;
			}
		}
		
		this.teleportIfOutOfBounds();

	}
}