package fx;

	import flixel.*;
	import flixel.addons.display.FlxNestedSprite;
	import flixel.FlxObject;
	import flixel.util.loaders.TexturePackerData;
	/**
	 * ...
	 * @author Esti
	 */
	class SwordClash extends FlxNestedSprite
	{
		public function new() 
		{		
			super();
			
			var t:TexturePackerData = new TexturePackerData("assets/data/spritesData.json", "assets/images/spritesheetTp.png");
			this.loadGraphicFromTexture(t);
			
			this.animation.addByPrefix("clash", "swordHit", 30, false);
			immovable = true;
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

