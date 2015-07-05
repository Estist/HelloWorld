package;
import flixel.addons.weapon.FlxWeapon;
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
import fx.DashEffect;
import fx.FallEffect;
import fx.JumpEffect;
import fx.RunEffect;
import fx.WallSlideEffect;
import haxe.remoting.FlashJsConnection;
import openfl.display.BlendMode;
import utils.AttackBox;
import flixel.util.FlxVelocity;

/**
 * ...
 * @author Esti
 */
class Player extends FlxNestedSprite
{
	private var start:FlxPoint;
	private var _jump:Float;
	public var _jumpPower:Int;
	private var menu:MenuState;
	private var trailArea:FlxTrailArea;
	public var walljumpBox:FlxNestedSprite;
	
	private var canDash:Bool = true;
	private var canShield:Bool = true;
	private var canAttack:Bool = true;
	private var justWallJumped:Bool = false;
	
	public var attackBoxRight:AttackBox;
	public var attackBoxLeft:AttackBox;
	public var attackBoxDown:AttackBox;
	public var attackBoxUp:AttackBox;
	
	public var itemSlot:Bomb = null;
	
	//40x50 - 91-77
	public var mainHitbox:AttackBox;
	
	public var isAttacking:Bool = false;
	public var isAttackingUp:Bool = false;
	public var isAttackingDown:Bool = false;
	public var isAttackingLeft:Bool = false;
	public var isAttackingRight:Bool = false;
	public var isDead:Bool = false;
	public var isClashing:Bool = false;
	public var isDashing:Bool = false;
	public var isShieldOn:Bool = false;
	public var isShocked:Bool = false;
	public var canDie:Bool = true;
	var justTouchedWall:Bool;

	var originalBlendDebug:BlendMode;
	
	public var weapon:FlxWeapon;
	public var currentImpulse:Impulse;

	//settings
	//control stuff
	private var controlSens:Float = 0.3;
	private var controlSensY:Float = 0.45;
	var creatingWallFx:Bool = false;
	var creatingRunFx:Bool = false;
	public var gamepadIntIdDebug:Int = 0;

	//movement stuff
	//public var runSpeed:UInt = 360;
	public var runSpeed:UInt = 380;
	public var accelerationY:Float = 1150;
	//public var accelerationY:Float = 1250;
	//public var jumpPower:Int = 570;
	public var jumpPower:Int = 600;
	//public var wallSlideFactor:Float = 1.2;
	public var wallSlideFactor:Float = 1.1;
	public var wallJumpVelocityX:Float = 500;
	public var wallJumpAcclereationX:Float = 5000;
	public var wallJumpVelocityY:Float = 1.1;
	public var dragConstant:Int = 8;
	//public var dragConstant:Int = 8;
	public var airStopingVelConstant = 1.7;
	public var lateWalljumpTime = 0.4;
	public var pressedDownAddedVelocity = 80;
	public var dashDuration = 0.10;
	public var dashVelocity = 1000;
	
	//graphics stuff
	public var offsetX:Int = 85;
	public var offsetY:Int = 81;
	public var Width:Int = 50;
	public var Height:Int = 50;
	
	public var livesLeft:Int = Register.startingLives;
	public var forceWalljumpImpulse:Bool = false;
	public var isImpulsing:Bool;
	public var shouldResetImpulse:Bool;
	public var canShoot:Bool = true;

	public var gamepad(get, never):FlxGamepad;
	public function get_gamepad():FlxGamepad 
	{
		var gamepad:FlxGamepad = /*FlxG.gamepads.lastActive*/FlxG.gamepads.getByID(this.gamepadIntIdDebug);
		if (gamepad == null)
		{
			// Make sure we don't get a crash on neko when no gamepad is active
			//gamepad = FlxG.gamepads.getByID(0);
		}
		return gamepad;
	}
	
	public function get_GamepadDebug():FlxGamepad 
	{
		var gamepad:FlxGamepad = /*FlxG.gamepads.lastActive*/FlxG.gamepads.getByID(this.gamepadIntIdDebug);
		if (gamepad == null)
		{
			// Make sure we don't get a crash on neko when no gamepad is active
			//gamepad = FlxG.gamepads.getByID(0);
		}
		return gamepad;
	}
	
	public function new(x:Int,y:Int,menu:MenuState , gamepadIntDebug:Int) 
	{
		super(x,y);
		
		//this.loadGraphic("assets/images/spritesheet.png", true, 72, 72);
		
		//this.addAnimations();
		
		this.gamepadIntIdDebug = gamepadIntDebug;
		this.addAnimationsWithTp();
		this.antialiasing = true;
		this.menu = menu;
		
		health = 1;
		//basic player physics
		var runSpeed:UInt = this.runSpeed;
		drag.x = runSpeed* this.dragConstant;
		acceleration.y = this.accelerationY;
		_jumpPower = this.jumpPower;
		maxVelocity.x = runSpeed;
		maxVelocity.y = _jumpPower;

		start = new FlxPoint(x, y);

		facing = FlxObject.RIGHT;
		width = this.Width;
		height = this.Height;
		offset.x = this.offsetX;
		offset.y = this.offsetY;
		
		this.attackBoxRight = new AttackBox(0, 0);
		this.attackBoxRight.relativeX = 125;
		this.attackBoxRight.relativeY = 80;
		this.attackBoxRight.width = 85;
		this.attackBoxRight.height = 40;
		this.attackBoxRight.visible = false;
		this.attackBoxRight.solid = false;
		this.attackBoxRight.makeGraphic( cast(this.attackBoxRight.width,Int), cast(this.attackBoxRight.height,Int));
		this.add(attackBoxRight);
		this.attackBoxRight.parent = this;
		
		this.attackBoxLeft = new AttackBox(0, 0);
		this.attackBoxLeft.relativeX = 15;
		this.attackBoxLeft.relativeY = 80;
		this.attackBoxLeft.width = 85;
		this.attackBoxLeft.height = 40;
		this.attackBoxLeft.visible = false;
		this.attackBoxLeft.solid = false;
		this.attackBoxLeft.makeGraphic( cast(this.attackBoxLeft.width,Int), cast(this.attackBoxLeft.height,Int));
		this.add(attackBoxLeft);
		this.attackBoxLeft.parent = this;
		
		this.attackBoxUp = new AttackBox(0, 0);
		this.attackBoxUp.relativeX = 85;
		this.attackBoxUp.relativeY = 0;
		this.attackBoxUp.width = 60;
		this.attackBoxUp.height = 60;
		this.attackBoxUp.visible = false;
		this.attackBoxUp.solid = false;
		this.attackBoxUp.makeGraphic( cast(this.attackBoxUp.width,Int), cast(this.attackBoxUp.height,Int));
		this.add(attackBoxUp);
		this.attackBoxUp.parent = this;
		
		this.attackBoxDown = new AttackBox(0, 0);
		this.attackBoxDown.relativeX = 85;
		this.attackBoxDown.relativeY = 130;
		this.attackBoxDown.width = 60;
		this.attackBoxDown.height =60;
		this.attackBoxDown.visible = false;
		this.attackBoxDown.solid = false;
		this.attackBoxDown.makeGraphic( cast(this.attackBoxDown.width,Int), cast(this.attackBoxDown.height,Int));
		this.add(attackBoxDown);
		this.attackBoxDown.parent = this;
		
		this.mainHitbox = new AttackBox(0, 0);
		this.mainHitbox.relativeX = 91;
		this.mainHitbox.relativeY = 77;
		this.mainHitbox.width = 40;
		this.mainHitbox.height = 50;
		this.mainHitbox.visible = true;
		this.mainHitbox.solid = true;
		this.mainHitbox.makeGraphic( cast(this.mainHitbox.width,Int), cast(this.mainHitbox.height,Int));
		//this.add(mainHitbox);
		this.mainHitbox.parent = this;
		
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		
		this.walljumpBox = new FlxNestedSprite();
		//this.walljumpBox.centerOffsets();
		this.walljumpBox.width = 90;
		this.walljumpBox.height = 90;
		//this.walljumpBox.relativeX = 85;
		//this.walljumpBox.relativeY = 130;
		this.walljumpBox.makeGraphic(90, 90);
		//this.add(walljumpBox);
		
		//this.weapon = new FlxWeapon("pistol", this);	
		//this.weapon.makePixelBullet(99, 40, 20, 0xf9999);
		//this.weapon.setBulletDirection(FlxWeapon.BULLET_NORTH_EAST,100);
	
		//this.add(this.walljumpBox);
		
		//blur shit
		// The first thing to do is setting up the FlxTrailArea
		//trailArea = new FlxTrailArea( -500, 0, FlxG.width - 200, FlxG.height, 0.4, 2, false, true);
		//trailArea.blend=flash.display.BlendMode.INVERT;
		//trailArea.add(this);
		//this.menu.add(trailArea);
	}
	
	
	public function addAnimationsWithTp()
	{
		var t:TexturePackerData = Register.texturePackerData;
		this.loadGraphicFromTexture(t);
		
		if (this.gamepadIntIdDebug == 0)
		{
			this.animation.addByPrefix("idle", "punk_idle", 30, true);
			this.animation.addByPrefix("run", "runPunk", 40, true);
			this.animation.addByPrefix("attackDown", "punk_attack_floorDown", 50, false);
			this.animation.addByPrefix("attack", "punk_attack_floorSide", 50, false);
			this.animation.addByPrefix("attackUp", "punk_attack_floorUp", 50, false);
			this.animation.addByPrefix("death", "punk_death", 30, false);
			this.animation.addByPrefix("jumpDown", "punk_jumpDown", 30, false);
			this.animation.addByPrefix("jumpFall", "punk_idle_0001.png", 30, false);
			this.animation.addByPrefix("jumpUp", "punk_jumpDown_0006.png", 30, false);
			this.animation.addByPrefix("wallSlide", "punk_walljump_0001.png", 30, false);
			this.animation.addByPrefix("wallJump", "punk_walljump_0001.png", 40, false);
		}
		else
		{
			this.animation.addByPrefix("idle", "IdleExport", 30, true);
			this.animation.addByPrefix("run", "run2Export", 40, true);
			this.animation.addByPrefix("jumpDown", "JumpDownExport", 30, false);
			this.animation.addByPrefix("jumpFall", "JumpFallExport", 30, false);
			this.animation.addByPrefix("jumpUp", "JumpUpExport0006.png", 30, false);
			//this.animation.addByPrefix("preJump", "PreJumpExp", 30, false);
			this.animation.addByPrefix("attack", "sword_floorSideCutExport", 50, false);
			this.animation.addByPrefix("attackDown", "sword_floorDown", 50, false);
			this.animation.addByPrefix("attackUp", "sword_floorUpExport", 50, false);
			//this.animation.addByPrefix("shield", "Chief_CoverNoBallEXPORT", 40, false);
			this.animation.addByPrefix("death", "AirDeathExport", 30, false);
			this.animation.addByPrefix("wallSlide", "wallJumpOutExport0001.png", 30, false);
			this.animation.addByPrefix("wallJump", "wallJumpOutExport", 40, false);
		}
		
		//this.animation.addByPrefix("dash", "DashPositionEXPORT", 30, false);
		
		FlxG.bitmap.dumpCache();
	}
	
	public function debugAttack():Void
	{
		this.canDie = false;
		new FlxTimer(1, resetAttackDebug, 0);
	}
	
	public function resetAttackDebug(Timer:FlxTimer):Void
	{
		this.animation.play("attackUp");
		this.isAttackingUp = true;
		this.isAttacking = true;
		FlxG.sound.play("slash", 0.3);
		new FlxTimer(Register.AttackCooldown, resetAttack, 1);
		this.canAttack = false;
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
		this.teleportIfOutOfBounds();
			
		//FlxG.log.add(this.velocity.y + "velY" );
			
		//if(this.y <= 0 )
			
		//this.walljumpBox.setPosition(this.x, this.y);
		
		/*if(!isTouching(FlxObject.FLOOR))
		{
			acceleration.x = acceleration.x/3;
		}
		else*/
		
		this.walljumpBox.setPosition(this.getMidpoint().x, this.getMidpoint().y);
		
		acceleration.x = 0;
				
		this.checkAnimationStates();
		
		
		if (this.animation.curAnim != null && (  this.animation.curAnim.name == "shield" || this.animation.curAnim.name == "death" ))
		{
			this.animate();
			super.update();
			return;
		}
			
		FlxG.timeScale = 1;
			
		//this.checkAnimationStates();
		
		//FlxG.log.add(this.gamepad.firstJustPressedButtonID() + "idpad");
			
			
		//if(!this.animation.curAnim != null && this.animation.curAnim.name == "attack" && this.animation.curAnim.curFrame >=4)
		this.checkMovement();
				
		this.checkAttack();
		
		//this.checkShoot();
										
		this.checkWallJump();
				
		this.checkDash();
				
		this.animate();
		
		super.update();	
	
	}
	
	private function checkShoot():Void
	{
		if(this.pressedShoot() && this.canShoot)
		{
			var bullet = new Bullet();
			Register.bulletGroup.add(bullet);
			bullet.init(this.getMidpoint().x, this.getMidpoint().y);
			
			var playerSelected:Player = null;
			
			for (i in Register.playersGroup)
			{
				if (cast(i,Player) != this)
				{
					playerSelected = cast(i,Player);
				}
			}
			
			FlxVelocity.moveTowardsPoint(bullet, playerSelected.getMidpoint(), 1500);
			
			bullet.parent = this;
			
			this.canShoot = false;
			
			new FlxTimer(0.1, resetShoot, 1);	

		}
	}
	
	private function resetShoot(Timer:FlxTimer)
	{
		this.canShoot = true;
	}
	
	private function checkAnimationStates():Void
	{
		if (this.animation.curAnim != null && this.animation.curAnim.name == "attack" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames - 1)
		{
			this.isAttacking = false;
			this.isAttackingRight = false;
			this.isAttackingLeft = false;
		}
			
		if (this.animation.curAnim != null && this.animation.curAnim.name == "death" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames - 1)
		{
			this.setRevivedPosition();
			this.isDead = false;
		}
			
		if (this.animation.curAnim != null && this.animation.curAnim.name == "attackUp" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames - 1)
		{
			this.isAttacking = false;
			this.isAttackingUp = false;
		}
			
		if (this.animation.curAnim != null && this.animation.curAnim.name == "attackDown" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames - 1)
		{
			this.isAttacking = false;
			this.isAttackingDown = false;
		}
	}
	
	public function setRevivedPosition()
	{
		this.setPosition(this.menu.spawnPoints[this.gamepadIntIdDebug].x,this.menu.spawnPoints[this.gamepadIntIdDebug].y);
	}
	
	
	/*private function checkAnimationStates():Void
	{
			if (this.animation.curAnim != null && this.animation.curAnim.name == "attack" && this.animation.curAnim.curFrame == this.animation.curAnim.numFrames-1)
				FlxG.log.add("endedAttack!");
	}*/
	
	public function pressedShoot():Bool
	{
		return FlxG.keys.pressed.Z || gamepad.pressed(XboxButtonID.B);
	}
	
	public function pressedAttack():Bool
	{
		return FlxG.keys.justPressed.X || gamepad.justPressed(XboxButtonID.X);
	}
	
	public function pressedDown():Bool
	{
		return FlxG.keys.pressed.DOWN || /*( !this.isAttacking && this.facing != FlxObject.RIGHT) &&*/
					(gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_Y) > controlSensY || 	#if flash gamepad.pressed(XboxButtonID.DPAD_DOWN) #else gamepad.dpadDown #end);
	}
	
	public function onlyPressedDown():Bool
	{
		return FlxG.keys.pressed.DOWN || 
					(gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_Y) > controlSensY && Math.abs(gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X)) <  Math.abs(controlSens) 
					|| 	#if flash gamepad.pressed(XboxButtonID.DPAD_DOWN) #else gamepad.dpadDown #end);
	}
	
	public function pressedUp():Bool
	{
		return FlxG.keys.pressed.UP || /*!(this.isAttacking && this.facing == FlxObject.RIGHT) &&*/
					(gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_Y) < -controlSensY || 	#if flash gamepad.pressed(XboxButtonID.DPAD_UP) #else gamepad.dpadUp #end);
	}
	
	public function onlyPressedUp():Bool
	{
		return FlxG.keys.pressed.UP || 
					(gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_Y) < -controlSensY && Math.abs(gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X)) <  Math.abs(controlSens) 
					|| 	#if flash gamepad.pressed(XboxButtonID.DPAD_UP) #else gamepad.dpadUp #end);
	}
	
	private function checkAttack():Void
	{	
		if ( this.pressedAttack() && this.canAttack /*&& this.animation.curAnim != null && this.animation.curAnim.name != "attack" */)
		{
			//this.offset.x = (this.facing == FlxObject.RIGHT ? 61 : 78);
			//this.offset.y = -4;
			this.canAttack = false;
			new FlxTimer(Register.AttackCooldown, resetAttack, 1);
			
			//FlxG.log.add((gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_Y) + "!"));
			
			if (this.pressedDown())
			{
				this.animation.play("attackDown");
				this.isAttackingDown = true;
			}
			else if (this.pressedUp())
			{
				this.animation.play("attackUp");
				this.isAttackingUp = true;
			}
			else
			{
				this.animation.play("attack");
				
				if (this.facing == FlxObject.RIGHT)
					this.isAttackingRight = true;
				else
					this.isAttackingLeft = true;
					
			}
			
			this.isAttacking = true;
			FlxG.sound.play("slash", 0.3);
			
			if (this.itemSlot != null)
			{
				this.throwItem();
			}
		}
		
		//acceleration at the attack frame
		if (this.animation.curAnim != null && this.animation.curAnim.curFrame == 6 )
		{
			if(this.animation.curAnim.name == "attack")
				if(facing==FlxObject.RIGHT)
				velocity.x +=  250;
				else
				velocity.x -=  250;
			else if (this.animation.curAnim.name == "attackUp")
			{
				
			}
			else
			{
				
			}
		}
		
		this.attackBoxLeft.solid = false;
		this.attackBoxRight.solid = false;
		this.attackBoxUp.solid = false;
		this.attackBoxDown.solid = false;
		
		if (this.animation.curAnim != null && (this.animation.curAnim.name == "attack" || this.animation.curAnim.name == "attackUp" || this.animation.curAnim.name == "attackDown") 
		&& this.animation.curAnim.curFrame >= 5	&& this.animation.curAnim.curFrame <= 7 && !this.isShocked && !this.isClashing && !this.isDead && this.isAttacking)
		{
			if (this.animation.curAnim.name == "attack")
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
			else
			if (this.animation.curAnim.name == "attackUp")
			{
				this.attackBoxUp.solid = true;
			}
			else
			{
				this.attackBoxDown.solid = true;
			}
			
		}
	}
	
	private function extraConditionsToMove():Bool
	{
		return !this.forceWalljumpImpulse;
	}
	
	private function checkMovement():Void
	{
		if (this.menu.gameEnded)
			return;
		
		if (FlxG.keys.pressed.LEFT || !(this.isAttacking && this.facing == FlxObject.RIGHT) && /*extraConditionsToMove() &&*//*!this.forceWalljumpImpulse &&*/
					(gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) < -controlSens || 	#if flash gamepad.pressed(XboxButtonID.DPAD_LEFT) #else gamepad.dpadLeft #end))
				{
					facing = FlxObject.LEFT;
					
					var addAdjust:Float = 1;
					if (velocity.x > 0)
					addAdjust = 2; 
						
					acceleration.x -= drag.x * addAdjust;
				}
		else if(FlxG.keys.pressed.RIGHT || !(this.isAttacking && this.facing == FlxObject.LEFT) && /*extraConditionsToMove() &&*//*!this.forceWalljumpImpulse &&*/
				(gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) > controlSens || #if flash gamepad.pressed(XboxButtonID.DPAD_RIGHT) #else gamepad.dpadRight #end))
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
					this.addJumpFx();
				}

				if ((FlxG.keys.justReleased.Z || gamepad.justReleased(XboxButtonID.A)) && velocity.y < 0) {
				
					velocity.y = velocity.y / this.airStopingVelConstant;
				}
				
				//down speed up
				if (velocity.y > 0 && this.onlyPressedDown())
				{
					maxVelocity.y = _jumpPower + this.pressedDownAddedVelocity;
					velocity.y += 4;
				}
				else
					maxVelocity.y = _jumpPower;
	}
	
	private function checkWallJump():Void
	{
		var wallSlideFactor:Float = this.wallSlideFactor;
		if (this.isTouching(FlxObject.WALL) /*|| (this.justTouchedWall && !this.isTouching(FlxObject.FLOOR))*/)
		{				
			if(this.isTouching(FlxObject.RIGHT))
			{
				if (FlxG.keys.pressed.RIGHT  || gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) > controlSens) 
					{
						velocity.y = velocity.y / wallSlideFactor;
					}	
			}
					
			if(this.isTouching(FlxObject.LEFT))
			{
				if (FlxG.keys.pressed.LEFT || gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) < -controlSens) 
				{
					velocity.y = velocity.y / wallSlideFactor;
				}	
			}	
					
			if (FlxG.keys.justPressed.Z || gamepad.justPressed(XboxButtonID.A))
			{
				if(this.isTouching(FlxObject.RIGHT))
				{
					this.applyWaljumpLeft();
				}
				else
				{	
					this.applyWaljumpRight();
				}
								
				this.doWalljump();
			}
		}
		else if ((this.justTouchedWall && !this.isTouching(FlxObject.FLOOR)))
		{
			if (FlxG.keys.justPressed.Z || gamepad.justPressed(XboxButtonID.A))
			{
				if(facing == FlxObject.LEFT)
				{
					this.applyWaljumpLeft();
				}
				else
				{	
					this.applyWaljumpRight();
				}
								
				this.doWalljump();
			}
		}
			
		if (this.isTouching(FlxObject.WALL) && !this.justTouchedWall)
		{
			this.justTouchedWall = true;
			new FlxTimer(this.lateWalljumpTime, resetWallTouching, 1);
			this.forceWalljumpImpulse = false;
		}
	}
	
	private function applyWaljumpRight():Void
	{
		velocity.x = this.wallJumpVelocityX;
		acceleration.x +=  this.wallJumpAcclereationX;
		
		//Impulse.GiveForwardImpulse(0.1, this, 100, 0, false);

	}
	
	private function applyWaljumpLeft():Void
	{
		velocity.x = -this.wallJumpVelocityX;
		acceleration.x -=  this.wallJumpAcclereationX;
		
		//Impulse.GiveForwardImpulse(0.1, this, 100, 0, true);
	}
	
	private function doWalljump():Void
	{
		velocity.y = -_jumpPower / this.wallJumpVelocityY;
		this.justWallJumped = true;
		this.justTouchedWall = false;
		this.forceWalljumpImpulse = true;
		new FlxTimer(0.5, resetWalljumpImpulse, 1);	
	}
	
	private function forceMovement():Void
	{
		
		
	}
	

	private function resetWallTouching(Timer:FlxTimer)
	{
		if(!this.isTouching(FlxObject.WALL))
			this.justTouchedWall = false;
	}
	
	private function resetWalljumpImpulse(Timer:FlxTimer)
	{
		this.forceWalljumpImpulse = false;
	}
		
	private function checkDash():Void
	{
		if((FlxG.keys.justPressed.A || gamepad.justPressed(XboxButtonID.RB)))
		{
			if (FlxG.keys.anyPressed(["LEFT", "RIGHT" , "UP", "DOWN"]) || gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) < -controlSens || 
			gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X)  > controlSens || (gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_Y) > controlSensY)
			|| (gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_Y) < -controlSensY))
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
	
	private function resetAttack(Timer:FlxTimer):Void
	{
		this.canAttack = true;
	}
	
	private function resetDash(Timer:FlxTimer):Void
	{
		this.canDash = true;
	}
	
	private function resetClash(Timer:FlxTimer):Void
	{
		this.isClashing = false;
	}
	
	private function resetImpulsing(Timer:FlxTimer):Void
	{
		if(this.shouldResetImpulse)
			this.isImpulsing = false;
	}
	
	private function resetShield(Timer:FlxTimer):Void
	{
		this.canShield = true;
	}
	
	private function resetShocked(Timer:FlxTimer):Void
	{
		this.blend = this.originalBlendDebug;
		this.isShocked = false;
		this.resetShockPenalty();
	}
	
	private function endDash(Timer:FlxTimer):Void
	{
		this.isDashing = false;
	}
	
	private function endShield(Timer:FlxTimer):Void
	{
		this.isShieldOn = false;
	}
	
	public function doDash():Void
	{
		new FlxTimer(Register.dashCooldown, resetDash, 1);

		var dashEffect = new DashEffect();
		dashEffect.flipX = this.flipX;
		
		
		if ((this.pressedDown() || this.pressedUp()) && !this.isTouching(FlxObject.FLOOR))
		{
			if (this.pressedDown())
			{
				Impulse.GiveVerticalImpulse(this.dashDuration, this, this.dashVelocity, 0, true, 1);
				//dashEffect.set_angle(90);
				//dashEffect.angle = 90;
			}
			else
			{
				var dashReduced:Int = cast(this.dashVelocity / 4, Int);
				Impulse.GiveVerticalImpulse(this.dashDuration/2, this, dashReduced, 0, true, 2);
				//dashEffect.angle = -90;
			}			
		}
		else
			Impulse.GiveForwardImpulse(this.dashDuration, this, this.dashVelocity);
		
		this.canDash = false;

		dashEffect.init(findMidPointForObject(dashEffect));
		Register.effectsGroup.add(dashEffect);
		
		/*this.isDashing = true;
		new FlxTimer(Register.dashDuration, endDash, 1);
		this.animation.play("dash");*/
	}
	
	public function addFallFx():Void
	{
		var fallFx = new FallEffect();
		fallFx.init(findMidLowerPointForObject(fallFx));
		//fallFx.y += ;
		Register.effectsGroup.add(fallFx);
	}
	
	public function addJumpFx():Void
	{
		var jFx = new JumpEffect();
		jFx.init(findMidLowerPointForObject(jFx));
		//fallFx.y += this.height - fallFx.height;
		Register.effectsGroup.add(jFx);
	}
	
	public function findMidPointForObject( sprite:FlxSprite):FlxPoint
	{
		return new FlxPoint(this.getMidpoint().x - sprite.getMidpoint().x , this.getMidpoint().y - sprite.getMidpoint().y);
	}
	
	public function findMidLowerPointForObject( sprite:FlxSprite):FlxPoint
	{
		return new FlxPoint(this.getMidpoint().x - sprite.getMidpoint().x , this.getMidpoint().y - sprite.getMidpoint().y  + (this.height-sprite.height)/2);
	}
	
	public function findMidRightPointForObject( sprite:FlxSprite):FlxPoint
	{
		return new FlxPoint(this.getMidpoint().x - sprite.getMidpoint().x + (this.width - sprite.width)/2 , this.getMidpoint().y - sprite.getMidpoint().y);
	}
	
	public function findMidLeftPointForObject( sprite:FlxSprite):FlxPoint
	{
		return new FlxPoint(this.getMidpoint().x - sprite.getMidpoint().x - (this.width - sprite.width)/2 , this.getMidpoint().y - sprite.getMidpoint().y);
	}
	
	public function doClash():Void
	{
		if(this.isAttackingRight || this.isAttackingLeft)
			Impulse.GiveForwardImpulse(0.15, this, 1000, 0, true);
		else
			Impulse.GiveVerticalImpulse(0.15, this, 1000, 0, true);
			
		this.isImpulsing = true;
		this.shouldResetImpulse = true;
		
		new FlxTimer(0.15, resetImpulsing, 1);
		
		this.isClashing = true;
		this.isAttacking = false;
		new FlxTimer(0.02, resetClash, 1);
	}
	
	public function doShield():Void
	{
		//this.animation.play("shield");
		new FlxTimer(Register.shieldCooldown, resetShield, 1);
		new FlxTimer(Register.shieldDuration, endShield, 1);
		this.canShield = false;
		//this.canDash = false;
		this.isShieldOn = true;
	}
	
	public function doShock():Void
	{
		if (this.isShocked)
			return;
			
		this.originalBlendDebug = this.blend;
		this.blend = BlendMode.INVERT;	
		
		this.setShockPenalty();
			
		Impulse.GiveForwardImpulse(0.18, this, 1000, 0, true);	
		this.isShocked = true;
		new FlxTimer(Register.shockCooldown, resetShocked, 1);
	}
	
	public function setShockPenalty():Void
	{
		//this.maxVelocity.x = this.maxVelocity.x - 100;
		//this.maxVelocity.y = this.maxVelocity.y - 100;
		this.canAttack = false;
		this.canDash = false;
	}
	
	public function resetShockPenalty():Void
	{
		//this.maxVelocity.x = this.maxVelocity.x + 100;
		//this.maxVelocity.y = this.maxVelocity.y + 100;
		this.canAttack = true;
		this.canDash = true;
	}
	
	
	public function animate():Void
	{

		if (this.animation.curAnim != null && (this.animation.curAnim.name == "attack" || this.animation.curAnim.name == "shield"|| this.animation.curAnim.name == "attackDown"|| 
		this.animation.curAnim.name == "attackUp" || this.animation.curAnim.name == "death") ||	this.isDashing)
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
				//if(this.velocity.y >= 200)
				this.addFallFx();
				
				this.animation.play("jumpFall");
			}
			
			if (isTouching(FlxObject.FLOOR))
				{
					if (velocity.x != 0 && velocity.y == 0 && (FlxG.keys.anyPressed(["LEFT", "RIGHT"]) ||
					   gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) > controlSens
					|| gamepad.getXAxis(XboxButtonID.LEFT_ANALOGUE_X) < -controlSens))
					{
						this.animation.play("run");
						this.addRunFx(this.facing);
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
						
						this.addWallFx(facing);
					}
					
					if(this.isTouching(FlxObject.LEFT))
					{
						facing = FlxObject.RIGHT;
						this.addWallFx(facing);

					}
					
					this.animation.play("wallSlide");

				}
				else if (velocity.y < 0 )
				{
					//FlxG.log.add("jumpUPT!!");

					//if(this.animation.curAnim != null && this.animation.curAnim.name != "jumpUp")
					
						//if (this.justWallJumped)
							//this.animation.play("wallJump");
						//else
							this.animation.play("jumpUp");
					
				}
				else if (velocity.y > 0 )
				{
					this.animation.play("jumpDown");
				}	
	}
	
	public function addWallFx(facing:Int)
	{
		if (this.creatingWallFx)
			return;
		
		new FlxTimer(0.1, resetWallFx);
		
		this.creatingWallFx = true;
		
		var slideFx = new WallSlideEffect();
		
		if (facing == FlxObject.RIGHT)
		{
			slideFx.init(findMidLeftPointForObject(slideFx),facing);
		}
		else
		{
			slideFx.init(findMidRightPointForObject(slideFx),facing);
		}
		
		Register.effectsGroup.add(slideFx);

	}
	
	public function addRunFx(facing:Int)
	{
		if (this.creatingRunFx)
			return;
		
		new FlxTimer(0.25, resetRunFx);
		
		this.creatingRunFx = true;
		
		var runFx = new RunEffect();
		
		if (facing == FlxObject.RIGHT)
		{
			runFx.init(findMidLowerPointForObject(runFx),facing);
		}
		else
		{
			runFx.init(findMidLowerPointForObject(runFx),facing);
		}
		
		Register.effectsGroup.add(runFx);
	}
	
	public function resetWallFx(timer:FlxTimer):Void
	{
		this.creatingWallFx = false;
	}
	
	public function resetRunFx(timer:FlxTimer):Void
	{
		this.creatingRunFx = false;
	}
	
	public function pickupItem(item:Bomb):Void
	{
		this.itemSlot = item;
	}
	
	public function throwItem():Void
	{
		var velocityX:Float;
		var velocityY:Float;
		
		if (pressedUp())
		{
			this.itemSlot.velocity.y = -600;
		}
		else
		if (pressedDown())
		{
			this.itemSlot.velocity.y = 600;
		}
		else
		{
			this.itemSlot.velocity.x = 500 * (this.flipX == true ? -1 : 1);
			this.itemSlot.velocity.y = -500;	
		}

		this.itemSlot.release();
		
		this.itemSlot = null;
	}	
	
	override public function kill():Void
	{
		/*if (!alive)
		{
			return;
		}*/
		
		//super.kill();
		if (this.isDead || !this.canDie)
			return;
			
		this.attackBoxDown.solid = false;
		this.attackBoxUp.solid = false;
		this.attackBoxRight.solid = false;
		this.attackBoxLeft.solid = false;
		
		FlxG.camera.shake(0.005, 0.1);
		FlxG.camera.flash(0xFFFFFF, 0.1);
		
		/*if(FlxG.timeScale == 1)
			FlxG.timeScale = 0.2;*/
		
		this.animation.play("death");
		//FlxG.sound.play("assets/sounds/Socapex - Monster_Hurt.mp3");
		FlxG.sound.play("hurt");
		
		this.isAttacking = false;
		this.isClashing = false;
		
		this.isDead = true;
		
		this.livesLeft --;
		
		this.menu.checkVictoy();
	}
		
}