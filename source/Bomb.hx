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

/**
 * ...
 * @author Esti
 */
class Bomb extends FlxNestedSprite
{

	public var exploding:Bool = false;
	public var pickedUp:Bool = false;
	public var canBePicked:Bool = true;
	public var parent:Player;
	public var dragConstant:Int = 1;
	public var exploded:Bool = false;
	public var wasTouchingPreviousFrame:Bool = false;
	public var touchs:Int = 0;
	
	public function new() 
	{
		super();

		var runSpeed:UInt = 360;
		drag.x = runSpeed* this.dragConstant;
	
		this.elasticity = 0.5;
		
		acceleration.y = 1000;
		
		
		var t:TexturePackerData = Register.texturePackerData;
		this.loadGraphicFromTexture(t);
		this.animation.addByPrefix("activated", "bombo_big_load", 30, true);
		this.animation.addByPrefix("idle", "bombo_big_load_0001", 30, false);
		this.animation.addByPrefix("hit", "bomb_big_white", 30, true);
		
		this.width = 30;
		this.height = 30;
		//this.offset.x = 22;
		this.offset.y = 16;
		
		
		this.antialiasing = true;

		//this.makeGraphic(cast(this.width, Int), cast(this.height, Int), FlxColor.RED);
		
		/*var centerDebug = new FlxNestedSprite(0,0);
		centerDebug.width = 2;
		centerDebug.height = 2;
		centerDebug.relativeX = this.getMidpoint().x;
		centerDebug.relativeY = this.getMidpoint().y;
		centerDebug.makeGraphic(cast(centerDebug.width, Int), cast(centerDebug.height, Int), FlxColor.YELLOW);
		this.add(centerDebug);*/
	
		//FlxG.log.add(this.getCenter() + "getcenter");
		//var t:TexturePackerData = new TexturePackerData("assets/data/spritesData.json", "assets/images/spritesheetTp.png");
		//this.loadGraphicFromTexture(t);
		
		//this.animation.addByPrefix("explode", "swordHit", 30, true);
	}
	
	public function init(x:Float,y:Float):Void
	{
		super.reset(x, y);
		this.animation.play("idle");	
	}
	
	public function explode()
	{
		if (!alive)
			return;
		
		var explosion = new Explosion();
		//explosion.init(this.getMidpoint().x - explosion.getMidpoint().x , this.getMidpoint().y - explosion.getMidpoint().y);
		explosion.init(Utils.findMidPointForObject(explosion,this).x,Utils.findMidPointForObject(explosion,this).y);
		Register.effectsGroup.add(explosion);
		FlxG.camera.shake(0.005, 0.05);
		this.exploding = true;
		this.exploded = true;
		
		FlxG.sound.play("explode",0.4);
		
		for (i in Register.playersGroup)
		{
			var player:Player = cast(i,Player);
			if (FlxMath.getDistance(player.getMidpoint(), this.getMidpoint()) <= 170)
				player.kill();
		}
		
		this.kill();
	}
	
	public function getCenter():FlxPoint
	{
		return new FlxPoint( this.x + this.width / 2 , this.y + this.height / 2);
	}
	
	public function explodeWithTimer(Timer:FlxTimer):Void
	{
		this.explode();
	}
	
	public function playFlicker(Timer:FlxTimer):Void
	{
		this.animation.play("activated");	
	}
	
	public function pickUp(parent:Player):Void
	{
		this.pickedUp = true;
		this.parent = parent;
	}
	
	public function release():Void
	{
		//this.parent = null;
		this.canBePicked = false;
		this.pickedUp = false;
		
		new FlxTimer(1, explodeWithTimer, 1);
		new FlxTimer(0.5, playFlicker, 1);
		//this.animation.play("activated");	
		this.elasticity = 0.5;
		this.touchs = 0;
		this.acceleration.y = 1000;
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
		/*if (this.isTouching(FlxObject.FLOOR) && this.wasTouchingPreviousFrame)
		{
			this.elasticity = 0;
		}*/

		if (!this.exploding && this.animation.curAnim != null)
		{
			var name:String = this.animation.curAnim.name;
			var curFrame:Int = this.animation.curAnim.curFrame; 
			var numFrames:Int = this.animation.curAnim.numFrames -1; 
			
			if (name == "hit" && curFrame == numFrames)
				if(this.canBePicked)
					this.animation.play("idle");
					else
					this.animation.play("activated");

		}
		
		if (this.justTouched(FlxObject.FLOOR))
		{
			var fx:RunEffect = new RunEffect();
			fx.init(this.findMidLowerPointForObject(fx), facing);
			Register.effectsGroup.add(fx);
			
			this.animation.play("hit");
			
			this.touchs ++;
		}
		
		if (this.touchs >= 4)
		{
			this.elasticity = 0;
		}

		super.update();
		
		acceleration.x = 0;
		
		this.teleportIfOutOfBounds();
		
		
		if (pickedUp)
		{
			if (parent != null)
			{
				this.x = parent.x + 10;
				this.y = parent.y - 50;
			}
		}

		/*if (this.exploding && this.animation.finished)
			kill();*/
	}
	
	public function findMidLowerPointForObject( sprite:FlxSprite):FlxPoint
	{
		return new FlxPoint(this.getMidpoint().x - sprite.getMidpoint().x , this.getMidpoint().y - sprite.getMidpoint().y  + (this.height-sprite.height)/2);
	}
		
	override public function destroy():Void 
	{
		super.destroy();
	}		
}