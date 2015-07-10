package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxRect;
import flixel.util.FlxTimer;
import flixel.util.loaders.TexturePackerData;
import openfl.display.Graphics;
import openfl.geom.Rectangle;
import utils.AttackBox;
import fx.SwordClash;
import flixel.input.gamepad.FlxGamepad;
import flixel.input.gamepad.XboxButtonID;
import openfl.display.BlendMode;
import utils.ZoomCamera;

import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.util.FlxSpriteUtil;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

import flixel.util.FlxRandom;
import flixel.util.FlxColor;
import flixel.util.FlxVelocity;

#if (cpp || neko)
import flixel.input.gamepad.FlxGamepad;
#end

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	
	private var _gamePad:FlxGamepad;
	private var player:Player;
	private var player2:Player;
	private var player3:Player;
	private var player4:Player;
	public var level:Level1;
	
	public static var darknessCanvas:FlxSprite;
	public var background:FlxSprite;
	var ligth:Ligth;
	var sapwnBombTimer:FlxTimer;
	
	public var cameraInviObject:FlxSprite;
	
	public var spawnPoints: Array<FlxPoint> = [new FlxPoint(300, 300), new FlxPoint(1000, 300), new FlxPoint(1000, 700), new FlxPoint(600, 500)];
	public var lifesTextPositions: Array<FlxPoint> = [new FlxPoint(50, 50), new FlxPoint(1800, 50) , new FlxPoint(50, 800), new FlxPoint(1800, 800)];
	
	public var livesCounterText1:FlxText;
	public var livesCounterText2:FlxText;
	public var livesCounterText3:FlxText;
	public var livesCounterText4:FlxText;
	public var gameEnded:Bool;
	public var endText:FlxText;
	 
	override public function create():Void
	{
		Register.texturePackerData = new TexturePackerData("assets/data/spritesData.json", "assets/images/spritesheettp.png");
		
		Register.playersGroup = new FlxGroup();
		Register.logicGroup = new FlxGroup();
		Register.effectsGroup = new FlxGroup();
		Register.overFxGroup = new FlxGroup();
		Register.uiGroup = new FlxGroup();
		Register.objectsGroup = new FlxGroup();
		Register.bulletGroup = new FlxGroup();
		Register.powerUpPickablesGroup = new FlxGroup();
		
		this.cameraInviObject = new FlxSprite();
		//Register.effectsGroup.add(cameraInviObject);
		
		livesCounterText1 = new FlxText(lifesTextPositions[0].x, lifesTextPositions[0].y,0,"",64);
		livesCounterText2 = new FlxText(lifesTextPositions[1].x, lifesTextPositions[1].y,0,"",64);
		livesCounterText3 = new FlxText(lifesTextPositions[2].x, lifesTextPositions[2].y,0,"",64);
		livesCounterText4 = new FlxText(lifesTextPositions[3].x, lifesTextPositions[3].y,0,"", 64);
		
		this.livesCounterText1.scrollFactor.set(0,0);
		this.livesCounterText2.scrollFactor.set(0,0);
		this.livesCounterText3.scrollFactor.set(0,0);
		this.livesCounterText4.scrollFactor.set(0,0);
		
		Register.uiGroup.add(this.livesCounterText1);
		Register.uiGroup.add(this.livesCounterText2);
		//Register.uiGroup.add(this.livesCounterText3);
		//Register.uiGroup.add(this.livesCounterText4);
		
		FlxG.mouse.visible = false;
		
		this.level = new Level1();
		FlxG.cameras.bgColor = 0xff144954;		
		add(level);
			
		/*#if android		
		this.player = new Player(600, 300, this, 0);
		this.player2 = new Player(800, 100, this,1);
		#else*/
		this.player = new Player(cast(spawnPoints[0].x, Int), cast(spawnPoints[0].y, Int), this, 0);
		this.player2 = new Player(cast(spawnPoints[1].x,Int), cast(spawnPoints[1].y, Int), this,1);
		
		//this.player = new Player(300, 300, this, 0);
		//this.player2 = new Player(300, 300, this,1);
		
		this.player3 = new Player(cast(spawnPoints[2].x,Int), cast(spawnPoints[2].y, Int), this,2);
		this.player4 = new Player(cast(spawnPoints[3].x, Int), cast(spawnPoints[3].y, Int), this, 3);
		//#end
		//this.player2.gamepadIntIdDebug = 1;
		
		/*var bombDebug:Bomb = new Bomb();
		bombDebug.init(500, 300);
		Register.objectsGroup.add(bombDebug);*/
		
		var crateDebug:Crate = new Crate();
		crateDebug.init(500, 500);
		Register.objectsGroup.add(crateDebug);
		
		/*var magnet:Magnet = new Magnet();
		var pos:FlxPoint = new FlxPoint(500, 170);
		magnet.init(pos);
		Register.objectsGroup.add(magnet);*/
			
		//this.player.animation.play("run", true);
		//this.player2.color = 0xff999999;
	
		//var playerDebug = new Player(500, 300, this);
		//playerDebug.gamepadIntIdDebug = 3;
		//playerDebug.debugAttack();
		//playerDebug.canDie = false;
				
		Register.playersGroup.add(this.player);
		Register.playersGroup.add(this.player2);
		//Register.playersGroup.add(this.player3);
		//Register.playersGroup.add(this.player4);
		//Register.playersGroup.add(this.player.walljumpBox);
		//Register.playersGroup.add(playerDebug);
		
		add(Register.playersGroup);
		add(level.blackBorder);
		add(Register.effectsGroup);
		add(Register.overFxGroup);
		add(Register.uiGroup);
		add(Register.objectsGroup);
		add(Register.bulletGroup);
		add(Register.powerUpPickablesGroup);

		//this.player.walljumpBox.visible = false;
		
		FlxG.worldBounds.set(0, 0, level.width, level.height);
			
		//	Don't let the camera wander off the edges of the map
		
		//#if android 
		//FlxG.camera.setBounds(-200, -150, level.width + 400 , level.height + 100);
		//#else
		FlxG.camera.setBounds(-200, -150, level.width + 400 , level.height + 100);
		//#end	
		//FlxG.log.add(level.width + "widhtlevel");
		
		//	The camera will follow the player
		FlxG.camera.follow(this.cameraInviObject, 1);
			
		//var cameraZoom:ZoomCamera = new ZoomCamera(200, 50, FlxG.width, FlxG.height, 1);
		//FlxG.cameras.reset(cameraZoom);
		//FlxG.cameras.add(cameraZoom);
		//cameraZoom.targetZoom = 2;
	
		//this.endGame();
		
		//FlxTween.tween(FlxG.camera, { x: this.cameraInviObject.x , y: this.cameraInviObject.y });
		
		//FlxG.watch.add(player, "x");
		//FlxG.watch.add(player, "y");
		//FlxG.watch.add(player, "acceleration.x","aX");
		//FlxG.watch.add(player, "acceleration.y","aY");
		//FlxG.watch.add(player, "velocity.y","vY");
		//FlxG.watch.add(player, "velocity.x","vX");
		
		Register.logicGroup.add(this.player.attackBoxRight);
		Register.logicGroup.add(this.player.attackBoxLeft);
		Register.logicGroup.add(this.player.attackBoxUp);
		Register.logicGroup.add(this.player.attackBoxDown);
				
		Register.logicGroup.add(this.player2.attackBoxRight);
		Register.logicGroup.add(this.player2.attackBoxLeft);
		Register.logicGroup.add(this.player2.attackBoxUp);
		Register.logicGroup.add(this.player2.attackBoxDown);
		
		Register.logicGroup.add(this.player3.attackBoxRight);
		Register.logicGroup.add(this.player3.attackBoxLeft);
		Register.logicGroup.add(this.player3.attackBoxUp);
		Register.logicGroup.add(this.player3.attackBoxDown);
		
		Register.logicGroup.add(this.player4.attackBoxRight);
		Register.logicGroup.add(this.player4.attackBoxLeft);
		Register.logicGroup.add(this.player4.attackBoxUp);
		Register.logicGroup.add(this.player4.attackBoxDown);
		
		/*Register.logicGroup.add(playerDebug.attackBoxRight);
		Register.logicGroup.add(playerDebug.attackBoxLeft);
		Register.logicGroup.add(playerDebug.attackBoxUp);
		Register.logicGroup.add(playerDebug.attackBoxDown);*/
		
		/*ligth = new Ligth();
		ligth.level = this.level;
		ligth.setupLigth(0, 0, "assets/images/ligth.png");
		ligth.startLigth();
		add(ligth);*/
		
		/*darknessCanvas = new FlxSprite();
		darknessCanvas.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
		darknessCanvas.scrollFactor.set();
		darknessCanvas.blend = flash.display.BlendMode.MULTIPLY;
		add(darknessCanvas);*/
		
		add(Register.logicGroup);
		
		//this.sapwnBombTimer = new FlxTimer(10, spawnRandomBomb, 0);
		this.sapwnBombTimer = new FlxTimer(10, spawnRandomCrate, 0);
		FlxG.sound.playMusic("background", 0.3, true);
		super.create();
	}
	
	public function endGame():Void
	{
		if (!this.gameEnded)
		{
			new FlxTimer(3, resetGame, 1);
		}
		
		this.endText = new FlxText(0, 300, 0, Register.winnerPlayer + " WINS!"   , 256, false);
		this.endText.scrollFactor.set(0, 0);
		this.endText.color = FlxColor.FUCHSIA;
		
		new FlxTimer(0.6,changeTextColor,0);
		//FlxG.camera.flash(FlxColor.WHITE, 3);
		endText.solid = false;
		//FlxVelocity.moveTowardsPoint(text, new FlxPoint(800,300) , 500);
		endText.moves = true;
		//text.acceleration.x = 0;
		//endText.velocity.x = 400;
		this.add(endText);
		
		this.gameEnded = true;
			
		//var xPos:Int =cast(player2.x, Int);
		//var yPos:Int = cast(player2.y, Int);

		
		//var cameraZoom:ZoomCamera = new ZoomCamera(5000, 5000, FlxG.width, FlxG.height, 1);
		//cameraZoom.follow(player2);
		//cameraZoom.focusOn(player2.getMidpoint());
		//var cameraZoom:ZoomCamera = new ZoomCamera();
		//FlxG.cameras.reset(cameraZoom);
		//FlxG.cameras.add(cameraZoom);

		//cameraZoom.target = player2;
		//cameraZoom.follow(player2);
		//cameraZoom.focusOn(player2.getMidpoint());
		//FlxG.camera.follow(this.player2, 1);

		//FlxG.cameras.add(cameraZoom);
		//cameraZoom.targetZoom = 1.5;
	}
	
	public function changeTextColor(flxTimer:FlxTimer)
	{
		this.endText.size = FlxRandom.floatRanged(100, 256);
	}
	
	public function checkVictoy():Void
	{
		if (this.player.livesLeft <= 0)
		{
			Register.winnerPlayer = "player2";
			endGame();
		}
		else if (this.player2.livesLeft <= 0)
		{
			
			Register.winnerPlayer = "player1";
			endGame();
		}
		
	}
	
	public function resetGame(timer:FlxTimer):Void
	{
		FlxG.resetGame();
	}
	
	public function spawnRandomCrate(Timer:FlxTimer):Void
	{
		var randomPOint:FlxPoint = new FlxPoint(FlxRandom.intRanged(400, 1300), FlxRandom.intRanged(100, 900));
		
		var bombDebug:Crate = new Crate();
		
		var objectDebug:FlxSprite = new FlxSprite(randomPOint.x,randomPOint.y);
		objectDebug.width = bombDebug.width;
		objectDebug.height = bombDebug.height;
		//objectDebug.visible = false;
		Register.objectsGroup.add(objectDebug);
		
		if (objectDebug.overlaps(this.level.map))
		{
			this.sapwnBombTimer.reset();
			objectDebug.destroy();
			spawnRandomCrate(new FlxTimer());
		}
		else
		{
			objectDebug.destroy();
			bombDebug.init(randomPOint.x,randomPOint.y);
			Register.objectsGroup.add(bombDebug);
		}
	}
	
	
	public function spawnRandomBomb(Timer:FlxTimer):Void
	{
		var randomPOint:FlxPoint = new FlxPoint(FlxRandom.intRanged(100, 1600), FlxRandom.intRanged(100, 900));
		
		var bombDebug:Bomb = new Bomb();
		
		var objectDebug:FlxSprite = new FlxSprite(randomPOint.x,randomPOint.y);
		objectDebug.width = bombDebug.width;
		objectDebug.height = bombDebug.height;
		//objectDebug.visible = false;
		Register.objectsGroup.add(objectDebug);
		
		if (objectDebug.overlaps(this.level.map))
		{
			this.sapwnBombTimer.reset();
			objectDebug.destroy();
			spawnRandomBomb(new FlxTimer());
		}
		else
		{
			objectDebug.destroy();
			bombDebug.init(randomPOint.x,randomPOint.y);
			Register.objectsGroup.add(bombDebug);
		}
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{				
		updateUi();
		/* _gamePad = FlxG.gamepads.lastActive;

        if (_gamePad != null)
        {
            gamepadControls();
        }*/
		
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(null);
		}
		
		if (FlxG.keys.justPressed.R)
		{
			FlxG.resetState();
		}
		
		if (FlxG.keys.justPressed.M)
		{
			var magnet:Magnet = new Magnet();
			//var pos:FlxPoint = new FlxPoint(500, 170);
			var pos:FlxPoint = new FlxPoint (Utils.findMidPointForObject(magnet,this.player).x ,Utils.findMidPointForObject(magnet,this.player).y - 200);
			magnet.init(pos);
			Register.objectsGroup.add(magnet);
		}
		
		var playerCenter:FlxPoint = this.findPlayersCenter();
		//FlxTween.tween(this.cameraInviObject, { x: playerCenter.x , y: playerCenter.y }, 0.1);
		this.cameraInviObject.setPosition(playerCenter.x, playerCenter.y);
		
		
		FlxG.collide(Register.playersGroup, this.level);
		FlxG.collide(Register.objectsGroup, this.level);
		FlxG.collide(Register.bulletGroup, this.level,collideBulletFunction);
	
		FlxG.overlap(Register.logicGroup, Register.objectsGroup, attackBombFunction );
		FlxG.overlap(Register.logicGroup, Register.playersGroup , killFunction);
		FlxG.overlap(Register.powerUpPickablesGroup, Register.playersGroup , pickItemsFunction);
		FlxG.overlap(Register.objectsGroup, Register.playersGroup , openCratesFunction);
		FlxG.overlap(Register.bulletGroup, Register.playersGroup , bulletKillFunction);
		//FlxG.overlap(Register.logicGroup, this.player , killFunction);
		//FlxG.overlap(Register.logicGroup, Register.logicGroup , clashFunction);
		//FlxG.overlap(this.player.attackBoxRight, this.player2 , killFunction);
		//FlxG.overlap(this.player.attackBoxRight, this.player2);
		
		super.update();

	}
	
	
	public function updateUi()
	{
		if(player != null)
			this.livesCounterText1.text = Std.string(this.player.livesLeft);
		if(player2 != null)
			this.livesCounterText2.text = Std.string(this.player2.livesLeft);
		if(player3 != null)
			this.livesCounterText3.text = Std.string(this.player3.livesLeft);
		if(player4 != null)
			this.livesCounterText4.text = Std.string(this.player4.livesLeft);
	}
	
	public function findPlayersCenter():FlxPoint
	{
		var coordX:Float = 0;
		var coordY:Float = 0;
		
		for ( i in Register.playersGroup) 
		{
			var player:Player = cast(i,Player);
			coordX += player.x;
			coordY += player.y;
		}
		
		
	/*for (dice in diceGroup)
	{
    if (dice.hold)
        dice.roll();
	}*/
		
		var finalPoint:FlxPoint = new FlxPoint( coordX / Register.playersGroup.countLiving(), coordY / Register.playersGroup.countLiving());

		//FlxG.log.add(finalPoint + "fiunalpoint");
		
		return new FlxPoint(finalPoint.x,finalPoint.y);
	}
	
	/*override public function draw():Void
    {
        ligth.setPosition(FlxG.mouse.x - ligth.width * .5, FlxG.mouse.y - ligth.height * .5);
        
        var gfx:Graphics = FlxSpriteUtil.flashGfxSprite.graphics;
        gfx.clear();

        darknessCanvas.pixels.fillRect(new Rectangle(0, 0, FlxG.width, FlxG.height), 0xff000000);
		//darknessCanvas.alpha = 0.8;
        FlxSpriteUtil.updateSpriteGraphic(darknessCanvas);
        super.draw();

    }*/

	
	/*private function clashFunction(box:AttackBox ,box2:AttackBox):Void
	{
		
		if(box.parent != box2.parent)
		{ 
			
			//los 2 players tienen que terminar con attacking false para no poder matar si clashearon
			this.ClashHitboxSwords(box.parent,box2.parent);
		}
	}*/
	private function collideBulletFunction(bullet:Bullet ,level:Level1):Void
	{
		bullet.explode();
	}
	
	private function bulletKillFunction(bullet:Bullet ,player:Player):Void
	{
		if (bullet.parent != player)
			player.kill();
	}
	
	private function openCratesFunction(item:FlxSprite ,player:Player):Void
	{		
		if (Type.getClass(item) == Crate)
		{
			var itemTemp:Crate = cast(item, Crate);
			
			if (!itemTemp.isOpen && itemTemp.canBeOpen && !player.isDead && itemTemp.active)
			{
				itemTemp.open();
			}
		}
	}
	
	private function pickItemsFunction(item:Item ,player:Player):Void
	{		
		//var itemTemp:Item = cast(item, Item);
		
		if (!item.pickedUp && item.canBePicked && player.itemSlot == null)
		{
			item.pickUp(player);
			player.pickupItem(item);
		}
		else if (!item.canBePicked) {
			//item.explode();
		}
	}
	
	private function killFunction(box:AttackBox ,player:Player):Void
	{
		if(box.parent != player)
		{ 
			if (player.animation.curAnim != null &&
			(player.animation.curAnim.name == "attack" && 
			player.facing != box.parent.facing && (box.parent.isAttackingLeft || 
			box.parent.isAttackingRight) || 
			(player.animation.curAnim.name == "attackDown" && box.parent.isAttackingUp) ||
			(player.animation.curAnim.name == "attackUp" && box.parent.isAttackingDown))
			
			&& player.animation.curAnim.curFrame >= 4)
			{
				if (!player.isClashing && !box.parent.isClashing)
				{
					this.ClashSwords(box,player);
				}
			}
			else
			if (player.isShieldOn)
			{
				box.parent.doShock();
			}
			else
			{
				player.kill();
				
				
				var deathImpulse:FlxPoint = new FlxPoint((player.getMidpoint().x - box.parent.getMidpoint().x), (player.getMidpoint().y - box.parent.getMidpoint().y));
				
				player.velocity.y = deathImpulse.y * 5;
				player.velocity.x = deathImpulse.x * 10;
			}
		}
	}
	
	private function attackBombFunction(box:AttackBox, bomb:Item)
	{
		if (Type.getClass(bomb) != Bomb)
			return;
		
		var bombCasted:Bomb = cast(bomb, Bomb);	
			
		if (bombCasted.alive && !bombCasted.exploding)
		{
			var deathImpulse:FlxPoint = new FlxPoint((bombCasted.getMidpoint().x - box.parent.getMidpoint().x), (bombCasted.getMidpoint().y - box.parent.getMidpoint().y));	
		
			bombCasted.velocity.y = deathImpulse.y * 5;
			bombCasted.velocity.y = deathImpulse.y * 5;
			//bomb.velocity.x = FlxMath.signOf( deathImpulse.x) * 100;
			//bomb.velocity.x = FlxMath.signOf( deathImpulse.y) * 1;
			bombCasted.playFlicker(new FlxTimer());
		}
	}
	
	private function ClashSwords(box:AttackBox ,player:Player)
	{
		//player.doClash();
		//box.parent.doClash();
		var Posx:Float = Math.abs(player.x + box.parent.x) / 2;
		var posy:Float = Math.abs(player.y + box.parent.y) / 2;
		//Impulse.GiveForwardImpulse(0.1, player, 800, 0, true);
		//Impulse.GiveForwardImpulse(0.1, box.parent, 800, 0 , true);
		var swordclash = new SwordClash();
		swordclash.init(Posx-swordclash.width/2 + player.width/2,posy-swordclash.height/2);
		Register.effectsGroup.add(swordclash);
		FlxG.camera.shake(0.005, 0.05);
		FlxG.camera.flash(0xFFFFFF, 0.05);
		FlxG.sound.play("clash");
		
		var verticalAttack:Bool = false;
		
		if (player.isAttackingDown || player.isAttackingUp)
			verticalAttack = true;
		
		player.isAttacking = false;
		box.parent.isAttacking = false;
		
		if (verticalAttack)
		{
			player.doClash();
			box.parent.doClash();
			return;
		}
		
		if (player.animation.curAnim.curFrame < box.parent.animation.curAnim.curFrame)	
		{
			player.doClash();
		}
		else if (player.animation.curAnim.curFrame > box.parent.animation.curAnim.curFrame)
		{
			box.parent.doClash();
		}
		else
		{
			player.doClash();
			box.parent.doClash();
		}	
	}
}