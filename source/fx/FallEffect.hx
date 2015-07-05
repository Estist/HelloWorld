package fx;

	import flixel.*;
	import flixel.addons.display.FlxNestedSprite;
	import flixel.FlxObject;
	import flixel.util.FlxPoint;
	import flixel.util.loaders.TexturePackerData;
	/**
	 * ...
	 * @author Esti
	 */
	class FallEffect extends FlxNestedSprite
	{
		public function new() 
		{		
			super();
			
			var t:TexturePackerData = Register.texturePackerData;
			this.loadGraphicFromTexture(t);
			
			this.animation.addByPrefix("fx", "floorFall_2", 30, false);
			immovable = true;
			
			//this.width = 208;			
			//this.scale.x = 0.5;
			//this.scale.y = 0.5;
			
			this.width = 93;
			this.height = 23;
			
			//this.height = 53;
			
			//this.updateHitbox();
			
			//this.centerOffsets();
		}
		 
		override public function update():Void
		{
			solid = false;
			super.update();
			
			if (this.animation.finished)
				kill();
		}
		
		override public function kill():Void
		{
			removeSprite();
		}
		
		public function init(/*x:Float,y:Float*/point:FlxPoint):Void
		{
			this.animation.play("fx");	
			//lifeTime = 0;
			super.reset(point.x,point.y);
		}
		
		private function removeSprite():Void
		{
			exists = false;
		}
		
		override public function destroy():Void 
		{
			super.destroy();
		}	
	}

