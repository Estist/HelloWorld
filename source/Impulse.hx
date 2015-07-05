package;

	import flixel.*;
	import flixel.FlxObject;
	/**
	 * ...
	 * @author Esti
	 */
	class Impulse extends FlxObject
	{
		public var timer1:Float=0;
		private var object:Player;
		private var accelerationPerFrame:Int;
		private var verticalAccelerationPerFrame:Int;
		private var direction:Int;
		private var decrement:Float;
		
		public function new() 
		{
			super();
			timer1 = 1;
			object = null;
		}
		
		public static function GiveForwardImpulse(duration:Float, object:Player ,accelerationPerFrame:Int , decrement:Float = 0 , ?inverted:Bool):Impulse
		{
			//cast(FlxG.state.recycle(Impulse), Impulse).init(duration, object,direction);
			var impulse:Impulse = new Impulse();
			var direction:Int;
			
			if (object.facing == FlxObject.RIGHT)
				direction = inverted ? -1: 1;
				else
				direction = inverted ? 1: -1;
			
			impulse.init(duration, object, direction,accelerationPerFrame ,decrement);		
			FlxG.state.add(impulse);
			
			return impulse;
			
			//_bots.recycle(Enemy).init(Math.floor(x + width / 2), Math.floor(y + height / 2), _botBullets, _botGibs, _player);
			//(FlxG.state.recycle(Delay) as Delay).init(Duration, OnComplete);
		}
		
		public static function GiveVerticalImpulse(duration:Float, object:Player ,accelerationPerFrame:Int , decrement:Float = 0 , ?inverted:Bool , ?withDirection:Int = 0):Void
		{
			//cast(FlxG.state.recycle(Impulse), Impulse).init(duration, object,direction);
			var impulse:Impulse = new Impulse();
			var direction:Int;
			
			if (withDirection != 0)
			{
				if (withDirection == 1)
				{
					direction = 1;
				}
				else
				{
					direction = -1;
				}
			}
			else
				if (object.isAttackingUp)
					direction = inverted ? 1: -1;
					else
					direction = inverted ? -1: 1;
			
			impulse.init(duration, object, direction,accelerationPerFrame ,decrement,true);		
			FlxG.state.add(impulse);
			
			//_bots.recycle(Enemy).init(Math.floor(x + width / 2), Math.floor(y + height / 2), _botBullets, _botGibs, _player);
			//(FlxG.state.recycle(Delay) as Delay).init(Duration, OnComplete);
		}
		
		override public function update():Void
		{
			super.update();
			
			this.timer1 += FlxG.elapsed;
			this.object.velocity.x += this.accelerationPerFrame * this.direction + (-decrement * this.timer1);
			
			this.object.velocity.y += this.verticalAccelerationPerFrame * this.direction + (-decrement * this.timer1);
			
			if (timer1 >= 0)
			{
				removeSprite();
			}
		}

		public function init(duration:Float, object:FlxSprite , direction:Int ,accelerationPerFrame:Int ,decrement:Float = 0 , ?vertical:Bool):Void
		{
			var player:Player = cast(object, Player); 
			
			if (player.currentImpulse != null)
				player.currentImpulse.cancelImpulse();
			
			player.currentImpulse = this;
			
			this.object = player;
			this.timer1 = -duration;
			
			if (vertical)
				this.verticalAccelerationPerFrame = accelerationPerFrame;
				else
				this.accelerationPerFrame = accelerationPerFrame;
				
			this.direction = direction;
			this.decrement = decrement;

			super.reset(0, 0);
		}
		
		private function removeSprite():Void
		{
			cast(object, Player).currentImpulse = null;
			
			timer1 = 1;
			object = null;
			exists = false;
		}
		
		public function cancelImpulse():Void
		{
			this.removeSprite();
		}

        override public function destroy():Void
        {
            super.destroy();
        }
		
	}

