package;
import flixel.addons.display.FlxNestedSprite;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.util.loaders.TexturePackerData;
import fx.Explosion;
import flixel.FlxG;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;
import flixel.FlxObject;
import fx.RunEffect;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

/**
 * ...
 * @author Esti
 */
class Crate extends FlxNestedSprite
{
	public var canBeOpen:Bool = false;
	public var parent:Player;
	public var dragConstant:Int = 1;
	public var touchs:Int = 0;
	public var isOpen:Bool = false;
	public var item:Item;
	
	public function new() 
	{
		super();
	
		//this.elasticity = 0.5;
		acceleration.y = 1500;
		
		var t:TexturePackerData = Register.texturePackerData;
		this.loadGraphicFromTexture(t);
		this.animation.addByPrefix("idle", "Crate", 30, false);
		
		this.width = 40;
		this.height = 34;
		
		
		//this.antialiasing = true;
		
	}
	
	public function init(x:Float,y:Float):Void
	{
		super.reset(x, y);
		this.animation.play("idle");
	}
	
	public function loadItem():Void
	{
		this.item = new MagnetPowerUp();
			
		var itemPosition:FlxPoint = Utils.findMidPointForObject(this.item,this);
		this.item.init(itemPosition.x, itemPosition.y);

		this.item.visible = false;
		this.item.solid = false;
		this.item.active = false;
		
		Register.objectsGroup.add(this.item);
		
	}
	
	public function open():Void
	{
		if (isOpen)
			return;
			
		this.loadItem();
			
		isOpen = true;
		
		throwItem();
	}
	
	public function throwItem():Void
	{
		this.item.visible = true;
		
		FlxTween.tween(this.item, { x:this.item.x, y:this.item.y - 100}, 0.3, {ease:FlxEase.sineOut, complete:activateItem, type:FlxTween.ONESHOT } );
	}
	
	private function activateItem(tween:FlxTween):Void
	{
		new FlxTimer(0.3, reallyActivateItem);
		
		this.item.acceleration.y = 0;
		this.item.active = true;
	}
	
	public function reallyActivateItem(timer:FlxTimer):Void
	{
		this.item.solid = true;
	}
	
	public function startShineItem():Void
	{
		
	}
	
	public function dissapear():Void
	{
		FlxTween.tween(this, { alpha:0}, 1, { complete:onDissapear, type:FlxTween.ONESHOT } );
	}
	
	public function onDissapear(tween:FlxTween):Void
	{
		destroy();
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
		if (this.item != null && this.item.pickedUp)
		{
			this.item = null;
			dissapear();
		}
		
		if (this.justTouched(FlxObject.FLOOR))
		{
			//var fx:RunEffect = new RunEffect();
			//fx.init(Utils.findMidLowerPointForObject(fx,this),facing);
			//Register.effectsGroup.add(fx);
			
			this.canBeOpen = true;
			
		}
		
		/*if (this.touchs >= 4)
		{
			this.elasticity = 0;
		}*/
		super.update();
		
		acceleration.x = 0;
		
		this.teleportIfOutOfBounds();
	}
	

	
	override public function destroy():Void 
	{
		super.destroy();
	}		
}