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
	var falling:Bool;
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
		acceleration.y = 0;
		
		var t:TexturePackerData = Register.texturePackerData;
		this.loadGraphicFromTexture(t);
		this.animation.addByIndices("appear", "crate_in_",[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],".png", 30, false);
		this.animation.addByIndices("falling", "crate_in_",[16],".png", 30, false);
		this.animation.addByIndices("hit", "crate_in_",[20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37],".png", 30, false);
		this.animation.addByPrefix("idle", "crate_loop_", 30, true);
		this.animation.addByPrefix("open", "crate_open_", 30, false);
		
		this.width = 149;
		this.height = 117;
		
		this.offset.y = -57;
		
		//this.antialiasing = true;
		
	}
	
	public function init(x:Float,y:Float):Void
	{
		super.reset(x, y);
		this.animation.play("appear");
	}
	
	public function fall():Void
	{
		this.animation.play("falling");
		this.falling = true;
		this.acceleration.y = 2000;
	}
	
	public function getReady():Void
	{
		this.animation.play("idle");
		this.canBeOpen = true;
		
		/*this.width = 114;
		this.height = 109;
		
		this.offset.y = -26;*/	
	}
	
	public function loadItem():Void
	{
		this.item = new MagnetPowerUp();
			
		var itemPosition:FlxPoint = Utils.findMidPointForObject(this.item,this);
		this.item.init(itemPosition.x, itemPosition.y);
		this.item.visible = false;
		this.item.solid = false;
		this.item.active = false;
		
		Register.powerUpPickablesGroup.add(this.item);
		
	}
	
	public function open():Void
	{
		if (isOpen || !canBeOpen)
			return;
			
		this.animation.play("open");
			
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
		
		if (this.animation == null )
			return;
		
		if (this.animation.curAnim != null && this.animation.curAnim.name == "appear" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames - 1)
		{
			fall();
		}
			
		if (this.animation.curAnim != null && this.animation.curAnim.name == "hit" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames - 1)
		{
			getReady();
		}
		
		if (this.justTouched(FlxObject.FLOOR))
		{
			this.falling = false;
			this.animation.play("hit");
		}
		
		super.update();
		
		acceleration.x = 0;
		
		this.teleportIfOutOfBounds();
	}
	

	
	override public function destroy():Void 
	{
		super.destroy();
	}		
}