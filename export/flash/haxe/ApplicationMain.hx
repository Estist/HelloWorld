#if !macro


@:access(lime.Assets)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new lime.app.Application ();
		app.create (config);
		openfl.Lib.application = app;
		
		#if !flash
		var stage = new openfl.display.Stage (app.window.width, app.window.height, config.background);
		stage.addChild (openfl.Lib.current);
		app.addModule (stage);
		#end
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/big version.dam");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/big version.dam.bak");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/mapcsv_group1_map1.csv");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/megaversion.dam");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/megaversion.dam.bak");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/megaversion3.dam");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/spritesData.json");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/texture.tps");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/textureNew.tps");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/textureWithFolders.tps");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/textureWithFoldersAndroid.tps");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/char_light.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/ligth.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/marco.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/piedritas.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/scene_light_blue.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0023.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0024.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0025.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0026.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0027.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0028.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0029.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0030.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0031.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0032.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0033.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0034.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0035.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0036.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0037.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0038.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0039.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0040.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0041.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0042.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0043.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0044.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0045.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/AirDeathExport0046.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/Chief_CoverNoBallExport0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0023.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0024.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/IdleExport0025.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpDownExport0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpDownExport0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpDownExport0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpDownExport0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpDownExport0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpDownExport0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpFallExport0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpFallExport0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpFallExport0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpFallExport0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpFallExport0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpFallExport0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpUpExport0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpUpExport0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpUpExport0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpUpExport0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpUpExport0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpUpExport0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/JumpUpExport0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/run2Export0023.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorDown0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorSideCutExport0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/sword_floorUpExport0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/wallJumpOutExport0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/wallJumpOutExport0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/wallJumpOutExport0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/wallJumpOutExport0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/wallJumpOutExport0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/chief/wallJumpOutExport0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/dashCloudEXPORT0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/DashFloor1EXPORT0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/DashFloor1EXPORT0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/DashFloor1EXPORT0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/DashFloor1EXPORT0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/DashFloor1EXPORT0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/DashFloor1EXPORT0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/DashFloor1EXPORT0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/DashFloor1EXPORT0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/DashGunTrailEXPORT.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/DashTrailExport.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0023.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorFall_2_0024.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0023.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump1_0024.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/floorJump2_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/fx_run_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/swordHit0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/FX/wallLoop_0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorDown_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorSide_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_attack_floorUp_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_dash_.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0023.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0024.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0025.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0026.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0027.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0028.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0029.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0030.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0031.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0032.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0033.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0034.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0035.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0036.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0037.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0038.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0039.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0040.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0041.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0042.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0043.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0044.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0045.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_death_0046.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0023.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0024.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_idle_0025.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_jumpDown_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_jumpDown_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_jumpDown_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_jumpDown_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_jumpDown_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_jumpDown_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/punk_walljump_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0023.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/punk/runPunk_0024.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/bombo_big_load_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/bombo_big_load_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/bombo_big_load_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/bombo_big_load_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/bombo_big_load_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/bombo_big_load_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/bombo_big_load_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/bombo_big_load_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/bomb_big_white_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/bomb_big_white_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/Crate.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0023.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0024.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0025.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0026.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0027.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0028.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0029.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0030.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0031.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0032.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0033.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0034.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0035.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/explosion_0036.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0001.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0003.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0004.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0005.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0006.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0007.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0008.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0009.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0010.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0011.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0012.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0013.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0014.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0015.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0016.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0017.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0018.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0019.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0020.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0021.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0022.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0023.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0024.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0025.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0026.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0027.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0028.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0029.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0030.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0031.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0032.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0033.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0034.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0035.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0036.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0037.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0038.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0039.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0040.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0041.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0042.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0043.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0044.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0045.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0046.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0047.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_main_0048.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprites/pUps/magnet_solo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/spritesheetTp.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tile01.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/towerfall_test2_002.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/backloop.ogg");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/clash.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/clash.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/electrify.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/explode.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/explodemini.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/hurt.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/hurt.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/jump.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/magnet_appear.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/slash.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/slash.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/touch_ground.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("Nokia Cellphone FC Small");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("assets/sounds/clash.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/slash.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/hurt.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/hurt.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/hurt.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/hurt.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/hurt.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/hurt.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/hurt.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (0),
			borderless: false,
			company: "HaxeFlixel",
			depthBuffer: false,
			file: "Prototype",
			fps: Std.int (60),
			fullscreen: false,
			hardware: true,
			height: Std.int (1080),
			orientation: "portrait",
			packageName: "com.example.myapp",
			resizable: true,
			stencilBuffer: true,
			title: "Prototype",
			version: "0.0.1",
			vsync: true,
			width: Std.int (1920),
			
		}
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 1920, 1080, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
