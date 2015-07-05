package;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxSpriteUtil;
import flixel.util.loaders.TexturePackerData;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.display.FlxNestedSprite;
import flixel.util.FlxTimer;
import flixel.input.gamepad.FlxGamepad;
import flixel.input.gamepad.XboxButtonID;

/**
 * ...
 * @author Esti
 */
class Player2Test extends FlxNestedSprite
{

	private var start:FlxPoint;
	private var _jump:Float;
	public var _jumpPower:Int;
	private var menu:MenuState;
	private var trailArea:FlxTrailArea;
	public var walljumpBox:FlxNestedSprite;
	private var canDash:Bool = true;
	private var canShield:Bool = true;
	private var isShieldOn:Bool = false;
	public var attackBoxRight:FlxNestedSprite;
	public var attackBoxLeft:FlxNestedSprite;
	public var attackBoxDown:FlxNestedSprite;
	public var attackBoxUp:FlxNestedSprite;
	private var justWallJumped:Bool = false;
	
	private var gamepad(get, never):FlxGamepad;
	private function get_gamepad():FlxGamepad 
	{
		var gamepad:FlxGamepad = /*FlxG.gamepads.lastActive*/ FlxG.gamepads.getByID(0);
		if (gamepad == null)
		{
			// Make sure we don't get a crash on neko when no gamepad is active
			//gamepad = FlxG.gamepads.getByID(0);
		}
		return gamepad;
	}
	
	public function new(x:Int,y:Int,menu:MenuState) 
	{
		super(x,y);
		
		//this.loadGraphic("assets/images/spritesheet.png", true, 72, 72);
		
		//this.addAnimations();
		this.addAnimationsWithTp();
		
		this.menu = menu;
		
		health = 1;
		//basic player physics
		var runSpeed:UInt = 300;
		drag.x = runSpeed*6;
		acceleration.y = 1050;
		_jumpPower = 600;
		maxVelocity.x = runSpeed;
		maxVelocity.y = _jumpPower;

		start = new FlxPoint(x, y);

		facing = FlxObject.RIGHT;
		width = 55;
		height = 70;
		offset.x = 80;
		offset.y = 63;
		
		this.attackBoxRight = new FlxNestedSprite(0, 0);
		this.attackBoxRight.relativeX = 145;
		this.attackBoxRight.relativeY = 60;
		this.attackBoxRight.width = 60;
		this.attackBoxRight.height = 50;
		this.attackBoxRight.visible = false;
		this.attackBoxRight.solid = false;
		this.attackBoxRight.makeGraphic( cast(this.attackBoxRight.width,Int), cast(this.attackBoxRight.height,Int));
		this.add(attackBoxRight);
		
		this.attackBoxLeft = new FlxNestedSprite(0, 0);
		this.attackBoxLeft.relativeX = 15;
		this.attackBoxLeft.relativeY = 60;
		this.attackBoxLeft.width = 60;
		this.attackBoxLeft.height = 50;
		this.attackBoxLeft.visible = false;
		this.attackBoxLeft.solid = false;
		this.attackBoxLeft.makeGraphic( cast(this.attackBoxLeft.width,Int), cast(this.attackBoxLeft.height,Int));
		this.add(attackBoxLeft);
		
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		
		this.walljumpBox = new FlxNestedSprite();
		this.walljumpBox.width = width+5;
		this.walljumpBox.height = height + 5;
		this.walljumpBox.makeGraphic(75, 75);
		//this.add(this.walljumpBox);
		
		//blur shit
		// The first thing to do is setting up the FlxTrailArea
		//trailArea = new FlxTrailArea( -10, 0, FlxG.width - 200, FlxG.height, 0.4, 2, false, true);
		//trailArea.blend=flash.display.BlendMode.INVERT;
		//trailArea.add(this);
		//this.menu.add(trailArea);
	}
	
	
	public function addAnimationsWithTp()
	{
		var t:TexturePackerData = new TexturePackerData("assets/data/spritesData.json", "assets/images/spritesheetTp.png");
		this.loadGraphicFromTexture(t);
		
		this.animation.addByPrefix("idle", "IdleExport", 30, true);
		this.animation.addByPrefix("jumpDown", "JumpDownExport", 30, false);
		this.animation.addByPrefix("jumpFall", "JumpFallExport", 30, false);
		this.animation.addByPrefix("jumpUp", "JumpUpExport0006.png", 30, false);
		this.animation.addByPrefix("preJump", "PreJumpExp", 30, false);
		this.animation.addByPrefix("run", "run2Export", 50, true);
		this.animation.addByPrefix("attack", "Chief_sword_floorSideCut copia", 50, false);
		this.animation.addByPrefix("shield", "Chief_CoverNoBallEXPORT", 40, false);
		this.animation.addByPrefix("death", "Chief_FloorDeath1Export", 30, false);
		this.animation.addByPrefix("wallSlide", "wallJumpOutExport0001.png", 30, false);
		this.animation.addByPrefix("wallJump", "wallJumpOutExport", 40, false);
		FlxG.bitmap.dumpCache();
	}
	
	override public function update():Void
	{
			
		//this.walljumpBox.setPosition(this.x, this.y);
		
		/*if(!isTouching(FlxObject.FLOOR))
		{
			acceleration.x = acceleration.x/3;
		}
		else*/
		acceleration.x = 0;
					
			if (this.animation.curAnim != null && (this.animation.curAnim.name == "shield" || this.animation.curAnim.name == "death"))
			{
				this.animate();
				super.update();
				return;
			}
			
			FlxG.timeScale = 1;
			
			this.checkAnimationStates();
			
			this.checkMovement();
				
			this.checkAttack();
										
			this.checkWallJump();
				
			this.checkDash();
				
			this.animate();
			
			super.update();	
			
			

	}
	
	private function checkAnimationStates():Void
	{
			if (this.animation.curAnim != null && this.animation.curAnim.name == "attack" && this.animation.finished)
				FlxG.log.add("endedAttack!");
	}
	
	private function checkAttack():Void
	{
		if (FlxG.keys.justPressed.X || gamepad.justPressed(XboxButtonID.X) /*&& this.animation.curAnim != null && this.animation.curAnim.name != "attack" */)
				{
					//this.offset.x = (this.facing == FlxObject.RIGHT ? 61 : 78);
					//this.offset.y = -4;
					this.animation.play("attack");
					
				}
				
				//acceleration at the attack frame
				if (this.animation.curAnim != null && this.animation.curAnim.name == "attack" && this.animation.curAnim.curFrame == 6 )
				{
					if(facing==FlxObject.RIGHT)
					velocity.x +=  1500;
					else
					velocity.x -=  1500;
				}
				
				this.attackBoxLeft.solid = false;
				this.attackBoxRight.solid = false;
				
				if (this.animation.curAnim != null && this.animation.curAnim.name == "attack" && this.animation.curAnim.curFrame >= 6 
					&& this.animation.curAnim.curFrame <= 8)
				{
					if (this.facing == FlxObject.RIGHT)
					{
						//FlxG.log.add("attackbosRIghActive!!");
						//this.attackBoxRight.active = true;	
						this.attackBoxRight.solid = true;

					}
					else
					if ( this.facing == FlxObject.LEFT)
					{
						//FlxG.log.add("attackbosRIghActive!!");
						this.attackBoxLeft.solid = true;
					}
				}
				
				
	}
	
	private function checkMovement():Void
	{
		if(FlxG.keys.pressed.LEFT ||  gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) < 0 
				|| #if flash gamepad.pressed(XboxButtonID.DPAD_LEFT) #else gamepad.dpadLeft #end)
				{
					facing = FlxObject.LEFT;
					
					var addAdjust:Float = 1;
					if (velocity.x > 0)
					addAdjust = 2; 
						
					acceleration.x -= drag.x * addAdjust;
				}
				else if(FlxG.keys.pressed.RIGHT ||  gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) > 0 
				|| #if flash gamepad.pressed(XboxButtonID.DPAD_RIGHT) #else gamepad.dpadRight #end)
				{
					
					var addAdjust:Float = 1;
					if (velocity.x < 0)
					addAdjust = 2; 
					
					facing = FlxObject.RIGHT;
					acceleration.x += drag.x * addAdjust;
				}
				
				if((FlxG.keys.justPressed.Z || gamepad.justPressed(XboxButtonID.A)) && velocity.y==0 )
				{	
					velocity.y = -_jumpPower;
				}

				if ((FlxG.keys.justReleased.Z || gamepad.justReleased(XboxButtonID.A)) && velocity.y < 0) {
				
					velocity.y = velocity.y / 1.7;
				}
	}
	
	private function checkWallJump():Void
	{
		if (this.isTouching(FlxObject.WALL))
				{				
					if(this.isTouching(FlxObject.RIGHT))
					{
						if (FlxG.keys.pressed.RIGHT  || gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) > 0) 
						{
							//this.animation.play("wallJump");

							velocity.y = velocity.y / 1.2;
						}
						
					}
					
					if(this.isTouching(FlxObject.LEFT))
					{
						if (FlxG.keys.pressed.LEFT || gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) < 0) 
						{
							//this.animation.play("wallJump");
							velocity.y = velocity.y /  1.2;
						}
						
					}	
					
					if (FlxG.keys.justPressed.Z || gamepad.justPressed(XboxButtonID.A))
					{
						if (facing == FlxObject.RIGHT)
						{
							velocity.x = -500;
							acceleration.x -=  5000;
						}
						else
						{	velocity.x = 500;
							acceleration.x +=  5000;
						}
								
						velocity.y = -_jumpPower / 1.5;
						this.justWallJumped = true;
					}
				}
	}
	
	private function checkDash():Void
	{
		if((FlxG.keys.justPressed.A || gamepad.justPressed(XboxButtonID.RB)))
		{
			if (FlxG.keys.anyPressed(["LEFT", "RIGHT"]) || gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) < 0 || gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X)  > 0)
			{
				if (this.canDash)
				{
					this.doDash();
				}
			}
			else
			{
				if(this.canShield)
					this.doShield();
			}
				
		}
	}
	
	private function resetDash(Timer:FlxTimer):Void
	{
		this.canDash = true;
		//this.canShield = true;

	}
	
	private function resetShield(Timer:FlxTimer):Void
	{
		this.canShield = true;
		//this.canDash = true;
		this.isShieldOn = false;
	}
	
	public function doDash():Void
	{
		new FlxTimer(Register.dashCooldown, resetDash, 1);
		Impulse.GiveForwardImpulse(0.05, this, 1500);
		this.canDash = false;
		//this.canShield = false;
	}
	
	public function doShield():Void
	{
		this.animation.play("shield");
		new FlxTimer(Register.shieldCooldown, resetShield, 1);
		this.canShield = false;
		//this.canDash = false;
		this.isShieldOn = true;
	}
	
	public function animate():Void
	{

		if (this.animation.curAnim != null && (this.animation.curAnim.name == "attack" || this.animation.curAnim.name == "shield"||
		this.animation.curAnim.name == "death"))
		{
					return;
		}
		else
		{
			//this.offset.x = 3;
			//this.offset.y = 0;
		}

			if (justTouched(FlxObject.FLOOR))
			{

				this.animation.play("jumpFall");
			}
			
			if (isTouching(FlxObject.FLOOR))
				{
					if (velocity.x != 0 && velocity.y == 0 && (FlxG.keys.anyPressed(["LEFT", "RIGHT"]) || gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) > 0
					|| gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) < 0))
					{
						this.animation.play("run");
					}
					else
					{
						if (this.animation.finished || this.animation.curAnim != null && this.animation.curAnim.name == "run")
						{
							this.animation.play("idle");
						}
					}
					
					this.justWallJumped = false;
					
				}
				else if (this.isTouching(FlxObject.WALL))
				{	
					this.justWallJumped = false;
					
					if(this.isTouching(FlxObject.RIGHT))
					{
						facing = FlxObject.LEFT;
					}
					
					if(this.isTouching(FlxObject.LEFT))
					{
						facing = FlxObject.RIGHT;
						
					}
					
					this.animation.play("wallSlide");

				}
				else if (velocity.y < 0 )
				{
					//FlxG.log.add("jumpUPT!!");

					//if(this.animation.curAnim != null && this.animation.curAnim.name != "jumpUp")
					
						if (this.justWallJumped)
							this.animation.play("wallJump");
						else
							this.animation.play("jumpUp");
					
				}
				else if (velocity.y > 0 )
				{
					this.animation.play("jumpDown");
				}	
	}
	
	override public function kill():Void
	{
		/*if (!alive)
		{
			return;
		}
		
		super.kill();*/
		
		FlxG.camera.shake(0.005, 0.1);
		FlxG.camera.flash(0xFFFFFF, 0.1);
		FlxG.timeScale = 0.2;
		
		this.animation.play("death");
	}
		
}