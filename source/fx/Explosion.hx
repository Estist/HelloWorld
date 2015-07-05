package fx;

	import flixel.*;
	import flixel.addons.display.FlxNestedSprite;
	import flixel.FlxObject;
	import flixel.util.loaders.TexturePackerData;
	/**
	 * ...
	 * @author Esti
	 */
	class Explosion extends FlxNestedSprite
	{
		public function new() 
		{		
			super();
			
			var t:TexturePackerData = Register.texturePackerData;
			this.loadGraphicFromTexture(t);
			
			this.animation.addByPrefix("clash", "explosion", 30, false);
			immovable = true;
			
			this.width = 277;
			this.height = 277;
			
			//this.scale.set(2, 2);
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
		
		public function init(x:Float,y:Float):Void
		{
			this.animation.play("clash");	
			//lifeTime = 0;
			super.reset(x,y);
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

