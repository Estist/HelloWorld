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
class Magnet extends FlxNestedSprite
{
	var falling:Bool;
	public var parent:Player;
	
	public function new() 
	{
		super();
		
		var t:TexturePackerData = Register.texturePackerData;
		this.loadGraphicFromTexture(t);
		this.animation.addByIndices("appear", "magnet_main_",[1,2,3,4,5,6,7],".png", 20, false);
		this.animation.addByIndices("fall", "magnet_main_",[8] ,".png",20, false);
		this.animation.addByIndices("hit", "magnet_main_",[11,12,13,14,15,16],".png", 30, false);
		this.animation.addByIndices("electro", "magnet_main_",[17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37],".png", 30, false);
		this.animation.addByIndices("dissapear", "magnet_main_",[38,39,40,41,42,43],".png", 30, false);
			
		//this.animation.callback("fall", 7, 7);
		//this.animation.callback("dissapear", 37, 37);
		//this.animation.callback("destroyAfterDissapear", 43, 43);
		//this.animation.callback("electroCute", 16, 16);
		
		//this.width = 174;
		this.width = 97;
		this.height = 144;
		this.offset.y = -4;
		this.offset.x = 77/2;
		
		//this.antialiasing = true;
		
	}
	
	public function init(point:FlxPoint):Void
	{
		super.reset(point.x, point.y);
		this.animation.play("appear");
		FlxG.sound.play("magnet_appear",0.8);
	}
	
	public function fall():Void
	{
		this.animation.play("fall");
		this.falling = true;
		
		this.acceleration.y = 2000;
	}
	
	public function electroCute():Void
	{
		this.animation.play("electro");
	}
	
	public function dissapear():Void
	{
		this.animation.play("dissapear");
	}
	
	public function destroyAfterDissapear():Void
	{
		this.kill();
	}
	
	override public function update():Void
	{
		if (this.animation == null )
			return;
		
		if (this.animation.curAnim != null && this.animation.curAnim.name == "appear" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames - 1)
		{
			fall();
		}
		
		if (this.animation.curAnim != null && this.animation.curAnim.name == "electro" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames - 1)
		{
			dissapear();
		}
		
		if (this.animation.curAnim != null && this.animation.curAnim.name == "hit" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames - 1)
		{
			electroCute();
		}
		
		if (this.animation.curAnim != null && this.animation.curAnim.name == "dissapear" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames - 1)
		{
			destroyAfterDissapear();
		}
		
		if (this.justTouched(FlxObject.FLOOR) && this.falling)
		{
			this.falling = false;
			FlxG.camera.stopFX();
			FlxG.camera.shake(0.008, 0.02);
			this.animation.play("hit");
			FlxG.sound.play("electrify",0.1);
			FlxG.sound.play("explode",0.2);
			//FlxG.camera.flash(FlxColor.WHITE, 0.1);
		}
		
		super.update();
	}
	
	override public function destroy():Void 
	{
		super.destroy();
	}		
}