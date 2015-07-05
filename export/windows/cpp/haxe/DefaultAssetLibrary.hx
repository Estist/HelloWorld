#if !lime_hybrid


package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if (flash || js)
import openfl.display.Loader;
import openfl.events.Event;
import openfl.net.URLLoader;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("assets/data/big version.dam", "assets/data/big version.dam");
		type.set ("assets/data/big version.dam", AssetType.TEXT);
		path.set ("assets/data/big version.dam.bak", "assets/data/big version.dam.bak");
		type.set ("assets/data/big version.dam.bak", AssetType.TEXT);
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		path.set ("assets/data/mapCSV_Group1_Map1.csv", "assets/data/mapCSV_Group1_Map1.csv");
		type.set ("assets/data/mapCSV_Group1_Map1.csv", AssetType.TEXT);
		path.set ("assets/data/megaversion.dam", "assets/data/megaversion.dam");
		type.set ("assets/data/megaversion.dam", AssetType.TEXT);
		path.set ("assets/data/megaversion.dam.bak", "assets/data/megaversion.dam.bak");
		type.set ("assets/data/megaversion.dam.bak", AssetType.TEXT);
		path.set ("assets/data/megaversion3.dam", "assets/data/megaversion3.dam");
		type.set ("assets/data/megaversion3.dam", AssetType.TEXT);
		path.set ("assets/data/spritesData.json", "assets/data/spritesData.json");
		type.set ("assets/data/spritesData.json", AssetType.TEXT);
		path.set ("assets/data/texture.tps", "assets/data/texture.tps");
		type.set ("assets/data/texture.tps", AssetType.TEXT);
		path.set ("assets/data/textureNew.tps", "assets/data/textureNew.tps");
		type.set ("assets/data/textureNew.tps", AssetType.TEXT);
		path.set ("assets/data/textureWithFolders.tps", "assets/data/textureWithFolders.tps");
		type.set ("assets/data/textureWithFolders.tps", AssetType.TEXT);
		path.set ("assets/images/1.png", "assets/images/1.png");
		type.set ("assets/images/1.png", AssetType.IMAGE);
		path.set ("assets/images/2.png", "assets/images/2.png");
		type.set ("assets/images/2.png", AssetType.IMAGE);
		path.set ("assets/images/charLight.png", "assets/images/charLight.png");
		type.set ("assets/images/charLight.png", AssetType.IMAGE);
		path.set ("assets/images/cityCartoon_01.swf", "assets/images/cityCartoon_01.swf");
		type.set ("assets/images/cityCartoon_01.swf", AssetType.TEXT);
		path.set ("assets/images/conceptLab.png", "assets/images/conceptLab.png");
		type.set ("assets/images/conceptLab.png", AssetType.IMAGE);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/images/ligth.png", "assets/images/ligth.png");
		type.set ("assets/images/ligth.png", AssetType.IMAGE);
		path.set ("assets/images/marco.png", "assets/images/marco.png");
		type.set ("assets/images/marco.png", AssetType.IMAGE);
		path.set ("assets/images/piedritas.png", "assets/images/piedritas.png");
		type.set ("assets/images/piedritas.png", AssetType.IMAGE);
		path.set ("assets/images/sceneLightBlue.png", "assets/images/sceneLightBlue.png");
		type.set ("assets/images/sceneLightBlue.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png", "assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png");
		type.set ("assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png", "assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png");
		type.set ("assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0001.png", "assets/images/sprites/chief/AirDeathExport0001.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0002.png", "assets/images/sprites/chief/AirDeathExport0002.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0003.png", "assets/images/sprites/chief/AirDeathExport0003.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0004.png", "assets/images/sprites/chief/AirDeathExport0004.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0005.png", "assets/images/sprites/chief/AirDeathExport0005.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0006.png", "assets/images/sprites/chief/AirDeathExport0006.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0007.png", "assets/images/sprites/chief/AirDeathExport0007.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0008.png", "assets/images/sprites/chief/AirDeathExport0008.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0009.png", "assets/images/sprites/chief/AirDeathExport0009.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0010.png", "assets/images/sprites/chief/AirDeathExport0010.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0011.png", "assets/images/sprites/chief/AirDeathExport0011.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0012.png", "assets/images/sprites/chief/AirDeathExport0012.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0013.png", "assets/images/sprites/chief/AirDeathExport0013.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0014.png", "assets/images/sprites/chief/AirDeathExport0014.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0015.png", "assets/images/sprites/chief/AirDeathExport0015.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0016.png", "assets/images/sprites/chief/AirDeathExport0016.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0017.png", "assets/images/sprites/chief/AirDeathExport0017.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0018.png", "assets/images/sprites/chief/AirDeathExport0018.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0019.png", "assets/images/sprites/chief/AirDeathExport0019.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0020.png", "assets/images/sprites/chief/AirDeathExport0020.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0021.png", "assets/images/sprites/chief/AirDeathExport0021.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0022.png", "assets/images/sprites/chief/AirDeathExport0022.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0023.png", "assets/images/sprites/chief/AirDeathExport0023.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0024.png", "assets/images/sprites/chief/AirDeathExport0024.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0025.png", "assets/images/sprites/chief/AirDeathExport0025.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0025.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0026.png", "assets/images/sprites/chief/AirDeathExport0026.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0026.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0027.png", "assets/images/sprites/chief/AirDeathExport0027.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0027.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0028.png", "assets/images/sprites/chief/AirDeathExport0028.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0028.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0029.png", "assets/images/sprites/chief/AirDeathExport0029.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0029.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0030.png", "assets/images/sprites/chief/AirDeathExport0030.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0030.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0031.png", "assets/images/sprites/chief/AirDeathExport0031.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0031.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0032.png", "assets/images/sprites/chief/AirDeathExport0032.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0032.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0033.png", "assets/images/sprites/chief/AirDeathExport0033.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0033.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0034.png", "assets/images/sprites/chief/AirDeathExport0034.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0034.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0035.png", "assets/images/sprites/chief/AirDeathExport0035.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0035.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0036.png", "assets/images/sprites/chief/AirDeathExport0036.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0036.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0037.png", "assets/images/sprites/chief/AirDeathExport0037.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0037.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0038.png", "assets/images/sprites/chief/AirDeathExport0038.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0038.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0039.png", "assets/images/sprites/chief/AirDeathExport0039.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0039.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0040.png", "assets/images/sprites/chief/AirDeathExport0040.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0040.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0041.png", "assets/images/sprites/chief/AirDeathExport0041.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0041.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0042.png", "assets/images/sprites/chief/AirDeathExport0042.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0042.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0043.png", "assets/images/sprites/chief/AirDeathExport0043.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0043.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0044.png", "assets/images/sprites/chief/AirDeathExport0044.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0044.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0045.png", "assets/images/sprites/chief/AirDeathExport0045.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0045.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0046.png", "assets/images/sprites/chief/AirDeathExport0046.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0046.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0001.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0001.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0002.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0002.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0003.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0003.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0004.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0004.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0005.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0005.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0006.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0006.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0007.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0007.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0008.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0008.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0009.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0009.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0010.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0010.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0011.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0011.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0001.png", "assets/images/sprites/chief/IdleExport0001.png");
		type.set ("assets/images/sprites/chief/IdleExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0002.png", "assets/images/sprites/chief/IdleExport0002.png");
		type.set ("assets/images/sprites/chief/IdleExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0003.png", "assets/images/sprites/chief/IdleExport0003.png");
		type.set ("assets/images/sprites/chief/IdleExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0004.png", "assets/images/sprites/chief/IdleExport0004.png");
		type.set ("assets/images/sprites/chief/IdleExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0005.png", "assets/images/sprites/chief/IdleExport0005.png");
		type.set ("assets/images/sprites/chief/IdleExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0006.png", "assets/images/sprites/chief/IdleExport0006.png");
		type.set ("assets/images/sprites/chief/IdleExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0007.png", "assets/images/sprites/chief/IdleExport0007.png");
		type.set ("assets/images/sprites/chief/IdleExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0008.png", "assets/images/sprites/chief/IdleExport0008.png");
		type.set ("assets/images/sprites/chief/IdleExport0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0009.png", "assets/images/sprites/chief/IdleExport0009.png");
		type.set ("assets/images/sprites/chief/IdleExport0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0010.png", "assets/images/sprites/chief/IdleExport0010.png");
		type.set ("assets/images/sprites/chief/IdleExport0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0011.png", "assets/images/sprites/chief/IdleExport0011.png");
		type.set ("assets/images/sprites/chief/IdleExport0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0012.png", "assets/images/sprites/chief/IdleExport0012.png");
		type.set ("assets/images/sprites/chief/IdleExport0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0013.png", "assets/images/sprites/chief/IdleExport0013.png");
		type.set ("assets/images/sprites/chief/IdleExport0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0014.png", "assets/images/sprites/chief/IdleExport0014.png");
		type.set ("assets/images/sprites/chief/IdleExport0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0015.png", "assets/images/sprites/chief/IdleExport0015.png");
		type.set ("assets/images/sprites/chief/IdleExport0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0016.png", "assets/images/sprites/chief/IdleExport0016.png");
		type.set ("assets/images/sprites/chief/IdleExport0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0017.png", "assets/images/sprites/chief/IdleExport0017.png");
		type.set ("assets/images/sprites/chief/IdleExport0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0018.png", "assets/images/sprites/chief/IdleExport0018.png");
		type.set ("assets/images/sprites/chief/IdleExport0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0019.png", "assets/images/sprites/chief/IdleExport0019.png");
		type.set ("assets/images/sprites/chief/IdleExport0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0020.png", "assets/images/sprites/chief/IdleExport0020.png");
		type.set ("assets/images/sprites/chief/IdleExport0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0021.png", "assets/images/sprites/chief/IdleExport0021.png");
		type.set ("assets/images/sprites/chief/IdleExport0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0022.png", "assets/images/sprites/chief/IdleExport0022.png");
		type.set ("assets/images/sprites/chief/IdleExport0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0023.png", "assets/images/sprites/chief/IdleExport0023.png");
		type.set ("assets/images/sprites/chief/IdleExport0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0024.png", "assets/images/sprites/chief/IdleExport0024.png");
		type.set ("assets/images/sprites/chief/IdleExport0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0025.png", "assets/images/sprites/chief/IdleExport0025.png");
		type.set ("assets/images/sprites/chief/IdleExport0025.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0001.png", "assets/images/sprites/chief/JumpDownExport0001.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0002.png", "assets/images/sprites/chief/JumpDownExport0002.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0003.png", "assets/images/sprites/chief/JumpDownExport0003.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0004.png", "assets/images/sprites/chief/JumpDownExport0004.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0005.png", "assets/images/sprites/chief/JumpDownExport0005.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0006.png", "assets/images/sprites/chief/JumpDownExport0006.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0001.png", "assets/images/sprites/chief/JumpFallExport0001.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0002.png", "assets/images/sprites/chief/JumpFallExport0002.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0003.png", "assets/images/sprites/chief/JumpFallExport0003.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0004.png", "assets/images/sprites/chief/JumpFallExport0004.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0005.png", "assets/images/sprites/chief/JumpFallExport0005.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0006.png", "assets/images/sprites/chief/JumpFallExport0006.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0001.png", "assets/images/sprites/chief/JumpUpExport0001.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0002.png", "assets/images/sprites/chief/JumpUpExport0002.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0003.png", "assets/images/sprites/chief/JumpUpExport0003.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0004.png", "assets/images/sprites/chief/JumpUpExport0004.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0005.png", "assets/images/sprites/chief/JumpUpExport0005.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0006.png", "assets/images/sprites/chief/JumpUpExport0006.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0007.png", "assets/images/sprites/chief/JumpUpExport0007.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0001.png", "assets/images/sprites/chief/run2Export0001.png");
		type.set ("assets/images/sprites/chief/run2Export0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0002.png", "assets/images/sprites/chief/run2Export0002.png");
		type.set ("assets/images/sprites/chief/run2Export0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0003.png", "assets/images/sprites/chief/run2Export0003.png");
		type.set ("assets/images/sprites/chief/run2Export0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0004.png", "assets/images/sprites/chief/run2Export0004.png");
		type.set ("assets/images/sprites/chief/run2Export0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0005.png", "assets/images/sprites/chief/run2Export0005.png");
		type.set ("assets/images/sprites/chief/run2Export0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0006.png", "assets/images/sprites/chief/run2Export0006.png");
		type.set ("assets/images/sprites/chief/run2Export0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0007.png", "assets/images/sprites/chief/run2Export0007.png");
		type.set ("assets/images/sprites/chief/run2Export0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0008.png", "assets/images/sprites/chief/run2Export0008.png");
		type.set ("assets/images/sprites/chief/run2Export0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0009.png", "assets/images/sprites/chief/run2Export0009.png");
		type.set ("assets/images/sprites/chief/run2Export0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0010.png", "assets/images/sprites/chief/run2Export0010.png");
		type.set ("assets/images/sprites/chief/run2Export0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0011.png", "assets/images/sprites/chief/run2Export0011.png");
		type.set ("assets/images/sprites/chief/run2Export0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0012.png", "assets/images/sprites/chief/run2Export0012.png");
		type.set ("assets/images/sprites/chief/run2Export0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0013.png", "assets/images/sprites/chief/run2Export0013.png");
		type.set ("assets/images/sprites/chief/run2Export0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0014.png", "assets/images/sprites/chief/run2Export0014.png");
		type.set ("assets/images/sprites/chief/run2Export0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0015.png", "assets/images/sprites/chief/run2Export0015.png");
		type.set ("assets/images/sprites/chief/run2Export0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0016.png", "assets/images/sprites/chief/run2Export0016.png");
		type.set ("assets/images/sprites/chief/run2Export0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0017.png", "assets/images/sprites/chief/run2Export0017.png");
		type.set ("assets/images/sprites/chief/run2Export0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0018.png", "assets/images/sprites/chief/run2Export0018.png");
		type.set ("assets/images/sprites/chief/run2Export0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0019.png", "assets/images/sprites/chief/run2Export0019.png");
		type.set ("assets/images/sprites/chief/run2Export0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0020.png", "assets/images/sprites/chief/run2Export0020.png");
		type.set ("assets/images/sprites/chief/run2Export0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0021.png", "assets/images/sprites/chief/run2Export0021.png");
		type.set ("assets/images/sprites/chief/run2Export0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0022.png", "assets/images/sprites/chief/run2Export0022.png");
		type.set ("assets/images/sprites/chief/run2Export0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0023.png", "assets/images/sprites/chief/run2Export0023.png");
		type.set ("assets/images/sprites/chief/run2Export0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0001.png", "assets/images/sprites/chief/sword_floorDown0001.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0002.png", "assets/images/sprites/chief/sword_floorDown0002.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0003.png", "assets/images/sprites/chief/sword_floorDown0003.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0004.png", "assets/images/sprites/chief/sword_floorDown0004.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0005.png", "assets/images/sprites/chief/sword_floorDown0005.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0006.png", "assets/images/sprites/chief/sword_floorDown0006.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0007.png", "assets/images/sprites/chief/sword_floorDown0007.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0008.png", "assets/images/sprites/chief/sword_floorDown0008.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0009.png", "assets/images/sprites/chief/sword_floorDown0009.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0010.png", "assets/images/sprites/chief/sword_floorDown0010.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0011.png", "assets/images/sprites/chief/sword_floorDown0011.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0012.png", "assets/images/sprites/chief/sword_floorDown0012.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0013.png", "assets/images/sprites/chief/sword_floorDown0013.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0014.png", "assets/images/sprites/chief/sword_floorDown0014.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0015.png", "assets/images/sprites/chief/sword_floorDown0015.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0016.png", "assets/images/sprites/chief/sword_floorDown0016.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0017.png", "assets/images/sprites/chief/sword_floorDown0017.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0018.png", "assets/images/sprites/chief/sword_floorDown0018.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0019.png", "assets/images/sprites/chief/sword_floorDown0019.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0001.png", "assets/images/sprites/chief/sword_floorSideCutExport0001.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0002.png", "assets/images/sprites/chief/sword_floorSideCutExport0002.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0003.png", "assets/images/sprites/chief/sword_floorSideCutExport0003.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0004.png", "assets/images/sprites/chief/sword_floorSideCutExport0004.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0005.png", "assets/images/sprites/chief/sword_floorSideCutExport0005.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0006.png", "assets/images/sprites/chief/sword_floorSideCutExport0006.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0007.png", "assets/images/sprites/chief/sword_floorSideCutExport0007.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0008.png", "assets/images/sprites/chief/sword_floorSideCutExport0008.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0009.png", "assets/images/sprites/chief/sword_floorSideCutExport0009.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0010.png", "assets/images/sprites/chief/sword_floorSideCutExport0010.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0011.png", "assets/images/sprites/chief/sword_floorSideCutExport0011.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0012.png", "assets/images/sprites/chief/sword_floorSideCutExport0012.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0013.png", "assets/images/sprites/chief/sword_floorSideCutExport0013.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0001.png", "assets/images/sprites/chief/sword_floorUpExport0001.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0002.png", "assets/images/sprites/chief/sword_floorUpExport0002.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0003.png", "assets/images/sprites/chief/sword_floorUpExport0003.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0004.png", "assets/images/sprites/chief/sword_floorUpExport0004.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0005.png", "assets/images/sprites/chief/sword_floorUpExport0005.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0006.png", "assets/images/sprites/chief/sword_floorUpExport0006.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0007.png", "assets/images/sprites/chief/sword_floorUpExport0007.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0008.png", "assets/images/sprites/chief/sword_floorUpExport0008.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0009.png", "assets/images/sprites/chief/sword_floorUpExport0009.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0010.png", "assets/images/sprites/chief/sword_floorUpExport0010.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0011.png", "assets/images/sprites/chief/sword_floorUpExport0011.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0012.png", "assets/images/sprites/chief/sword_floorUpExport0012.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0013.png", "assets/images/sprites/chief/sword_floorUpExport0013.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0014.png", "assets/images/sprites/chief/sword_floorUpExport0014.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0015.png", "assets/images/sprites/chief/sword_floorUpExport0015.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0001.png", "assets/images/sprites/chief/wallJumpOutExport0001.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0002.png", "assets/images/sprites/chief/wallJumpOutExport0002.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0003.png", "assets/images/sprites/chief/wallJumpOutExport0003.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0004.png", "assets/images/sprites/chief/wallJumpOutExport0004.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0005.png", "assets/images/sprites/chief/wallJumpOutExport0005.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0006.png", "assets/images/sprites/chief/wallJumpOutExport0006.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0001.png", "assets/images/sprites/FX/dashCloudEXPORT0001.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0002.png", "assets/images/sprites/FX/dashCloudEXPORT0002.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0003.png", "assets/images/sprites/FX/dashCloudEXPORT0003.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0004.png", "assets/images/sprites/FX/dashCloudEXPORT0004.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0005.png", "assets/images/sprites/FX/dashCloudEXPORT0005.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0006.png", "assets/images/sprites/FX/dashCloudEXPORT0006.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0007.png", "assets/images/sprites/FX/dashCloudEXPORT0007.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0008.png", "assets/images/sprites/FX/dashCloudEXPORT0008.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0009.png", "assets/images/sprites/FX/dashCloudEXPORT0009.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0010.png", "assets/images/sprites/FX/dashCloudEXPORT0010.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0011.png", "assets/images/sprites/FX/dashCloudEXPORT0011.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0001.png", "assets/images/sprites/FX/DashFloor1EXPORT0001.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0002.png", "assets/images/sprites/FX/DashFloor1EXPORT0002.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0003.png", "assets/images/sprites/FX/DashFloor1EXPORT0003.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0004.png", "assets/images/sprites/FX/DashFloor1EXPORT0004.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0005.png", "assets/images/sprites/FX/DashFloor1EXPORT0005.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0006.png", "assets/images/sprites/FX/DashFloor1EXPORT0006.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0007.png", "assets/images/sprites/FX/DashFloor1EXPORT0007.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0008.png", "assets/images/sprites/FX/DashFloor1EXPORT0008.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashGunTrailEXPORT.png", "assets/images/sprites/FX/DashGunTrailEXPORT.png");
		type.set ("assets/images/sprites/FX/DashGunTrailEXPORT.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashTrailExport.png", "assets/images/sprites/FX/DashTrailExport.png");
		type.set ("assets/images/sprites/FX/DashTrailExport.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0001.png", "assets/images/sprites/FX/floorFall_0001.png");
		type.set ("assets/images/sprites/FX/floorFall_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0002.png", "assets/images/sprites/FX/floorFall_0002.png");
		type.set ("assets/images/sprites/FX/floorFall_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0003.png", "assets/images/sprites/FX/floorFall_0003.png");
		type.set ("assets/images/sprites/FX/floorFall_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0004.png", "assets/images/sprites/FX/floorFall_0004.png");
		type.set ("assets/images/sprites/FX/floorFall_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0005.png", "assets/images/sprites/FX/floorFall_0005.png");
		type.set ("assets/images/sprites/FX/floorFall_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0006.png", "assets/images/sprites/FX/floorFall_0006.png");
		type.set ("assets/images/sprites/FX/floorFall_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0007.png", "assets/images/sprites/FX/floorFall_0007.png");
		type.set ("assets/images/sprites/FX/floorFall_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0008.png", "assets/images/sprites/FX/floorFall_0008.png");
		type.set ("assets/images/sprites/FX/floorFall_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0009.png", "assets/images/sprites/FX/floorFall_0009.png");
		type.set ("assets/images/sprites/FX/floorFall_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0010.png", "assets/images/sprites/FX/floorFall_0010.png");
		type.set ("assets/images/sprites/FX/floorFall_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0011.png", "assets/images/sprites/FX/floorFall_0011.png");
		type.set ("assets/images/sprites/FX/floorFall_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0012.png", "assets/images/sprites/FX/floorFall_0012.png");
		type.set ("assets/images/sprites/FX/floorFall_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0013.png", "assets/images/sprites/FX/floorFall_0013.png");
		type.set ("assets/images/sprites/FX/floorFall_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0014.png", "assets/images/sprites/FX/floorFall_0014.png");
		type.set ("assets/images/sprites/FX/floorFall_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0015.png", "assets/images/sprites/FX/floorFall_0015.png");
		type.set ("assets/images/sprites/FX/floorFall_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0016.png", "assets/images/sprites/FX/floorFall_0016.png");
		type.set ("assets/images/sprites/FX/floorFall_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0017.png", "assets/images/sprites/FX/floorFall_0017.png");
		type.set ("assets/images/sprites/FX/floorFall_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0018.png", "assets/images/sprites/FX/floorFall_0018.png");
		type.set ("assets/images/sprites/FX/floorFall_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0019.png", "assets/images/sprites/FX/floorFall_0019.png");
		type.set ("assets/images/sprites/FX/floorFall_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0020.png", "assets/images/sprites/FX/floorFall_0020.png");
		type.set ("assets/images/sprites/FX/floorFall_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0021.png", "assets/images/sprites/FX/floorFall_0021.png");
		type.set ("assets/images/sprites/FX/floorFall_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0022.png", "assets/images/sprites/FX/floorFall_0022.png");
		type.set ("assets/images/sprites/FX/floorFall_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0001.png", "assets/images/sprites/FX/floorFall_2_0001.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0002.png", "assets/images/sprites/FX/floorFall_2_0002.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0003.png", "assets/images/sprites/FX/floorFall_2_0003.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0004.png", "assets/images/sprites/FX/floorFall_2_0004.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0005.png", "assets/images/sprites/FX/floorFall_2_0005.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0006.png", "assets/images/sprites/FX/floorFall_2_0006.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0007.png", "assets/images/sprites/FX/floorFall_2_0007.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0008.png", "assets/images/sprites/FX/floorFall_2_0008.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0009.png", "assets/images/sprites/FX/floorFall_2_0009.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0010.png", "assets/images/sprites/FX/floorFall_2_0010.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0011.png", "assets/images/sprites/FX/floorFall_2_0011.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0012.png", "assets/images/sprites/FX/floorFall_2_0012.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0013.png", "assets/images/sprites/FX/floorFall_2_0013.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0014.png", "assets/images/sprites/FX/floorFall_2_0014.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0015.png", "assets/images/sprites/FX/floorFall_2_0015.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0016.png", "assets/images/sprites/FX/floorFall_2_0016.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0017.png", "assets/images/sprites/FX/floorFall_2_0017.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0018.png", "assets/images/sprites/FX/floorFall_2_0018.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0019.png", "assets/images/sprites/FX/floorFall_2_0019.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0020.png", "assets/images/sprites/FX/floorFall_2_0020.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0021.png", "assets/images/sprites/FX/floorFall_2_0021.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0022.png", "assets/images/sprites/FX/floorFall_2_0022.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0023.png", "assets/images/sprites/FX/floorFall_2_0023.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0024.png", "assets/images/sprites/FX/floorFall_2_0024.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0001.png", "assets/images/sprites/FX/floorJump1_0001.png");
		type.set ("assets/images/sprites/FX/floorJump1_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0002.png", "assets/images/sprites/FX/floorJump1_0002.png");
		type.set ("assets/images/sprites/FX/floorJump1_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0003.png", "assets/images/sprites/FX/floorJump1_0003.png");
		type.set ("assets/images/sprites/FX/floorJump1_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0004.png", "assets/images/sprites/FX/floorJump1_0004.png");
		type.set ("assets/images/sprites/FX/floorJump1_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0005.png", "assets/images/sprites/FX/floorJump1_0005.png");
		type.set ("assets/images/sprites/FX/floorJump1_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0006.png", "assets/images/sprites/FX/floorJump1_0006.png");
		type.set ("assets/images/sprites/FX/floorJump1_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0007.png", "assets/images/sprites/FX/floorJump1_0007.png");
		type.set ("assets/images/sprites/FX/floorJump1_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0008.png", "assets/images/sprites/FX/floorJump1_0008.png");
		type.set ("assets/images/sprites/FX/floorJump1_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0009.png", "assets/images/sprites/FX/floorJump1_0009.png");
		type.set ("assets/images/sprites/FX/floorJump1_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0010.png", "assets/images/sprites/FX/floorJump1_0010.png");
		type.set ("assets/images/sprites/FX/floorJump1_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0011.png", "assets/images/sprites/FX/floorJump1_0011.png");
		type.set ("assets/images/sprites/FX/floorJump1_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0012.png", "assets/images/sprites/FX/floorJump1_0012.png");
		type.set ("assets/images/sprites/FX/floorJump1_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0013.png", "assets/images/sprites/FX/floorJump1_0013.png");
		type.set ("assets/images/sprites/FX/floorJump1_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0014.png", "assets/images/sprites/FX/floorJump1_0014.png");
		type.set ("assets/images/sprites/FX/floorJump1_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0015.png", "assets/images/sprites/FX/floorJump1_0015.png");
		type.set ("assets/images/sprites/FX/floorJump1_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0016.png", "assets/images/sprites/FX/floorJump1_0016.png");
		type.set ("assets/images/sprites/FX/floorJump1_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0017.png", "assets/images/sprites/FX/floorJump1_0017.png");
		type.set ("assets/images/sprites/FX/floorJump1_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0018.png", "assets/images/sprites/FX/floorJump1_0018.png");
		type.set ("assets/images/sprites/FX/floorJump1_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0019.png", "assets/images/sprites/FX/floorJump1_0019.png");
		type.set ("assets/images/sprites/FX/floorJump1_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0020.png", "assets/images/sprites/FX/floorJump1_0020.png");
		type.set ("assets/images/sprites/FX/floorJump1_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0021.png", "assets/images/sprites/FX/floorJump1_0021.png");
		type.set ("assets/images/sprites/FX/floorJump1_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0022.png", "assets/images/sprites/FX/floorJump1_0022.png");
		type.set ("assets/images/sprites/FX/floorJump1_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0023.png", "assets/images/sprites/FX/floorJump1_0023.png");
		type.set ("assets/images/sprites/FX/floorJump1_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0024.png", "assets/images/sprites/FX/floorJump1_0024.png");
		type.set ("assets/images/sprites/FX/floorJump1_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0001.png", "assets/images/sprites/FX/floorJump2_0001.png");
		type.set ("assets/images/sprites/FX/floorJump2_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0002.png", "assets/images/sprites/FX/floorJump2_0002.png");
		type.set ("assets/images/sprites/FX/floorJump2_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0003.png", "assets/images/sprites/FX/floorJump2_0003.png");
		type.set ("assets/images/sprites/FX/floorJump2_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0004.png", "assets/images/sprites/FX/floorJump2_0004.png");
		type.set ("assets/images/sprites/FX/floorJump2_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0005.png", "assets/images/sprites/FX/floorJump2_0005.png");
		type.set ("assets/images/sprites/FX/floorJump2_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0006.png", "assets/images/sprites/FX/floorJump2_0006.png");
		type.set ("assets/images/sprites/FX/floorJump2_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0007.png", "assets/images/sprites/FX/floorJump2_0007.png");
		type.set ("assets/images/sprites/FX/floorJump2_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0008.png", "assets/images/sprites/FX/floorJump2_0008.png");
		type.set ("assets/images/sprites/FX/floorJump2_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0009.png", "assets/images/sprites/FX/floorJump2_0009.png");
		type.set ("assets/images/sprites/FX/floorJump2_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0010.png", "assets/images/sprites/FX/floorJump2_0010.png");
		type.set ("assets/images/sprites/FX/floorJump2_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0011.png", "assets/images/sprites/FX/floorJump2_0011.png");
		type.set ("assets/images/sprites/FX/floorJump2_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0012.png", "assets/images/sprites/FX/floorJump2_0012.png");
		type.set ("assets/images/sprites/FX/floorJump2_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0013.png", "assets/images/sprites/FX/floorJump2_0013.png");
		type.set ("assets/images/sprites/FX/floorJump2_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0014.png", "assets/images/sprites/FX/floorJump2_0014.png");
		type.set ("assets/images/sprites/FX/floorJump2_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0015.png", "assets/images/sprites/FX/floorJump2_0015.png");
		type.set ("assets/images/sprites/FX/floorJump2_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0016.png", "assets/images/sprites/FX/floorJump2_0016.png");
		type.set ("assets/images/sprites/FX/floorJump2_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0017.png", "assets/images/sprites/FX/floorJump2_0017.png");
		type.set ("assets/images/sprites/FX/floorJump2_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0018.png", "assets/images/sprites/FX/floorJump2_0018.png");
		type.set ("assets/images/sprites/FX/floorJump2_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0019.png", "assets/images/sprites/FX/floorJump2_0019.png");
		type.set ("assets/images/sprites/FX/floorJump2_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0001.png", "assets/images/sprites/FX/fx_run_0001.png");
		type.set ("assets/images/sprites/FX/fx_run_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0002.png", "assets/images/sprites/FX/fx_run_0002.png");
		type.set ("assets/images/sprites/FX/fx_run_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0003.png", "assets/images/sprites/FX/fx_run_0003.png");
		type.set ("assets/images/sprites/FX/fx_run_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0004.png", "assets/images/sprites/FX/fx_run_0004.png");
		type.set ("assets/images/sprites/FX/fx_run_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0005.png", "assets/images/sprites/FX/fx_run_0005.png");
		type.set ("assets/images/sprites/FX/fx_run_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0006.png", "assets/images/sprites/FX/fx_run_0006.png");
		type.set ("assets/images/sprites/FX/fx_run_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0007.png", "assets/images/sprites/FX/fx_run_0007.png");
		type.set ("assets/images/sprites/FX/fx_run_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0008.png", "assets/images/sprites/FX/fx_run_0008.png");
		type.set ("assets/images/sprites/FX/fx_run_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0009.png", "assets/images/sprites/FX/fx_run_0009.png");
		type.set ("assets/images/sprites/FX/fx_run_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0010.png", "assets/images/sprites/FX/fx_run_0010.png");
		type.set ("assets/images/sprites/FX/fx_run_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0011.png", "assets/images/sprites/FX/fx_run_0011.png");
		type.set ("assets/images/sprites/FX/fx_run_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0012.png", "assets/images/sprites/FX/fx_run_0012.png");
		type.set ("assets/images/sprites/FX/fx_run_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0013.png", "assets/images/sprites/FX/fx_run_0013.png");
		type.set ("assets/images/sprites/FX/fx_run_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0014.png", "assets/images/sprites/FX/fx_run_0014.png");
		type.set ("assets/images/sprites/FX/fx_run_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0001.png", "assets/images/sprites/FX/swordHit0001.png");
		type.set ("assets/images/sprites/FX/swordHit0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0002.png", "assets/images/sprites/FX/swordHit0002.png");
		type.set ("assets/images/sprites/FX/swordHit0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0003.png", "assets/images/sprites/FX/swordHit0003.png");
		type.set ("assets/images/sprites/FX/swordHit0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0004.png", "assets/images/sprites/FX/swordHit0004.png");
		type.set ("assets/images/sprites/FX/swordHit0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0005.png", "assets/images/sprites/FX/swordHit0005.png");
		type.set ("assets/images/sprites/FX/swordHit0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0006.png", "assets/images/sprites/FX/swordHit0006.png");
		type.set ("assets/images/sprites/FX/swordHit0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0007.png", "assets/images/sprites/FX/swordHit0007.png");
		type.set ("assets/images/sprites/FX/swordHit0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0008.png", "assets/images/sprites/FX/swordHit0008.png");
		type.set ("assets/images/sprites/FX/swordHit0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0009.png", "assets/images/sprites/FX/swordHit0009.png");
		type.set ("assets/images/sprites/FX/swordHit0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0010.png", "assets/images/sprites/FX/swordHit0010.png");
		type.set ("assets/images/sprites/FX/swordHit0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0011.png", "assets/images/sprites/FX/swordHit0011.png");
		type.set ("assets/images/sprites/FX/swordHit0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0001.png", "assets/images/sprites/FX/wallLoop_0001.png");
		type.set ("assets/images/sprites/FX/wallLoop_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0002.png", "assets/images/sprites/FX/wallLoop_0002.png");
		type.set ("assets/images/sprites/FX/wallLoop_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0003.png", "assets/images/sprites/FX/wallLoop_0003.png");
		type.set ("assets/images/sprites/FX/wallLoop_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0004.png", "assets/images/sprites/FX/wallLoop_0004.png");
		type.set ("assets/images/sprites/FX/wallLoop_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0005.png", "assets/images/sprites/FX/wallLoop_0005.png");
		type.set ("assets/images/sprites/FX/wallLoop_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0006.png", "assets/images/sprites/FX/wallLoop_0006.png");
		type.set ("assets/images/sprites/FX/wallLoop_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0007.png", "assets/images/sprites/FX/wallLoop_0007.png");
		type.set ("assets/images/sprites/FX/wallLoop_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0008.png", "assets/images/sprites/FX/wallLoop_0008.png");
		type.set ("assets/images/sprites/FX/wallLoop_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0009.png", "assets/images/sprites/FX/wallLoop_0009.png");
		type.set ("assets/images/sprites/FX/wallLoop_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0010.png", "assets/images/sprites/FX/wallLoop_0010.png");
		type.set ("assets/images/sprites/FX/wallLoop_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0011.png", "assets/images/sprites/FX/wallLoop_0011.png");
		type.set ("assets/images/sprites/FX/wallLoop_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0012.png", "assets/images/sprites/FX/wallLoop_0012.png");
		type.set ("assets/images/sprites/FX/wallLoop_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0013.png", "assets/images/sprites/FX/wallLoop_0013.png");
		type.set ("assets/images/sprites/FX/wallLoop_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0014.png", "assets/images/sprites/FX/wallLoop_0014.png");
		type.set ("assets/images/sprites/FX/wallLoop_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0015.png", "assets/images/sprites/FX/wallLoop_0015.png");
		type.set ("assets/images/sprites/FX/wallLoop_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0016.png", "assets/images/sprites/FX/wallLoop_0016.png");
		type.set ("assets/images/sprites/FX/wallLoop_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0017.png", "assets/images/sprites/FX/wallLoop_0017.png");
		type.set ("assets/images/sprites/FX/wallLoop_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0018.png", "assets/images/sprites/FX/wallLoop_0018.png");
		type.set ("assets/images/sprites/FX/wallLoop_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0019.png", "assets/images/sprites/FX/wallLoop_0019.png");
		type.set ("assets/images/sprites/FX/wallLoop_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0020.png", "assets/images/sprites/FX/wallLoop_0020.png");
		type.set ("assets/images/sprites/FX/wallLoop_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png", "assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png");
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png", "assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png");
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png", "assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png");
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png", "assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png");
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png", "assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png");
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0001.png", "assets/images/sprites/punk/punk_attack_floorDown_0001.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0002.png", "assets/images/sprites/punk/punk_attack_floorDown_0002.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0003.png", "assets/images/sprites/punk/punk_attack_floorDown_0003.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0004.png", "assets/images/sprites/punk/punk_attack_floorDown_0004.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0005.png", "assets/images/sprites/punk/punk_attack_floorDown_0005.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0006.png", "assets/images/sprites/punk/punk_attack_floorDown_0006.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0007.png", "assets/images/sprites/punk/punk_attack_floorDown_0007.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0008.png", "assets/images/sprites/punk/punk_attack_floorDown_0008.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0009.png", "assets/images/sprites/punk/punk_attack_floorDown_0009.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0010.png", "assets/images/sprites/punk/punk_attack_floorDown_0010.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0011.png", "assets/images/sprites/punk/punk_attack_floorDown_0011.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0012.png", "assets/images/sprites/punk/punk_attack_floorDown_0012.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0013.png", "assets/images/sprites/punk/punk_attack_floorDown_0013.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0014.png", "assets/images/sprites/punk/punk_attack_floorDown_0014.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0015.png", "assets/images/sprites/punk/punk_attack_floorDown_0015.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0016.png", "assets/images/sprites/punk/punk_attack_floorDown_0016.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0017.png", "assets/images/sprites/punk/punk_attack_floorDown_0017.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0018.png", "assets/images/sprites/punk/punk_attack_floorDown_0018.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0019.png", "assets/images/sprites/punk/punk_attack_floorDown_0019.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0002.png", "assets/images/sprites/punk/punk_attack_floorSide_0002.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0003.png", "assets/images/sprites/punk/punk_attack_floorSide_0003.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0004.png", "assets/images/sprites/punk/punk_attack_floorSide_0004.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0005.png", "assets/images/sprites/punk/punk_attack_floorSide_0005.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0006.png", "assets/images/sprites/punk/punk_attack_floorSide_0006.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0007.png", "assets/images/sprites/punk/punk_attack_floorSide_0007.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0008.png", "assets/images/sprites/punk/punk_attack_floorSide_0008.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0009.png", "assets/images/sprites/punk/punk_attack_floorSide_0009.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0010.png", "assets/images/sprites/punk/punk_attack_floorSide_0010.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0011.png", "assets/images/sprites/punk/punk_attack_floorSide_0011.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0012.png", "assets/images/sprites/punk/punk_attack_floorSide_0012.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0013.png", "assets/images/sprites/punk/punk_attack_floorSide_0013.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0014.png", "assets/images/sprites/punk/punk_attack_floorSide_0014.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0001.png", "assets/images/sprites/punk/punk_attack_floorUp_0001.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0002.png", "assets/images/sprites/punk/punk_attack_floorUp_0002.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0003.png", "assets/images/sprites/punk/punk_attack_floorUp_0003.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0004.png", "assets/images/sprites/punk/punk_attack_floorUp_0004.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0005.png", "assets/images/sprites/punk/punk_attack_floorUp_0005.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0006.png", "assets/images/sprites/punk/punk_attack_floorUp_0006.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0007.png", "assets/images/sprites/punk/punk_attack_floorUp_0007.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0008.png", "assets/images/sprites/punk/punk_attack_floorUp_0008.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0009.png", "assets/images/sprites/punk/punk_attack_floorUp_0009.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0010.png", "assets/images/sprites/punk/punk_attack_floorUp_0010.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0011.png", "assets/images/sprites/punk/punk_attack_floorUp_0011.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0012.png", "assets/images/sprites/punk/punk_attack_floorUp_0012.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0013.png", "assets/images/sprites/punk/punk_attack_floorUp_0013.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0014.png", "assets/images/sprites/punk/punk_attack_floorUp_0014.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0015.png", "assets/images/sprites/punk/punk_attack_floorUp_0015.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_dash_.png", "assets/images/sprites/punk/punk_dash_.png");
		type.set ("assets/images/sprites/punk/punk_dash_.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0001.png", "assets/images/sprites/punk/punk_death_0001.png");
		type.set ("assets/images/sprites/punk/punk_death_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0002.png", "assets/images/sprites/punk/punk_death_0002.png");
		type.set ("assets/images/sprites/punk/punk_death_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0003.png", "assets/images/sprites/punk/punk_death_0003.png");
		type.set ("assets/images/sprites/punk/punk_death_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0004.png", "assets/images/sprites/punk/punk_death_0004.png");
		type.set ("assets/images/sprites/punk/punk_death_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0005.png", "assets/images/sprites/punk/punk_death_0005.png");
		type.set ("assets/images/sprites/punk/punk_death_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0006.png", "assets/images/sprites/punk/punk_death_0006.png");
		type.set ("assets/images/sprites/punk/punk_death_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0007.png", "assets/images/sprites/punk/punk_death_0007.png");
		type.set ("assets/images/sprites/punk/punk_death_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0008.png", "assets/images/sprites/punk/punk_death_0008.png");
		type.set ("assets/images/sprites/punk/punk_death_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0009.png", "assets/images/sprites/punk/punk_death_0009.png");
		type.set ("assets/images/sprites/punk/punk_death_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0010.png", "assets/images/sprites/punk/punk_death_0010.png");
		type.set ("assets/images/sprites/punk/punk_death_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0011.png", "assets/images/sprites/punk/punk_death_0011.png");
		type.set ("assets/images/sprites/punk/punk_death_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0012.png", "assets/images/sprites/punk/punk_death_0012.png");
		type.set ("assets/images/sprites/punk/punk_death_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0013.png", "assets/images/sprites/punk/punk_death_0013.png");
		type.set ("assets/images/sprites/punk/punk_death_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0014.png", "assets/images/sprites/punk/punk_death_0014.png");
		type.set ("assets/images/sprites/punk/punk_death_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0015.png", "assets/images/sprites/punk/punk_death_0015.png");
		type.set ("assets/images/sprites/punk/punk_death_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0016.png", "assets/images/sprites/punk/punk_death_0016.png");
		type.set ("assets/images/sprites/punk/punk_death_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0017.png", "assets/images/sprites/punk/punk_death_0017.png");
		type.set ("assets/images/sprites/punk/punk_death_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0018.png", "assets/images/sprites/punk/punk_death_0018.png");
		type.set ("assets/images/sprites/punk/punk_death_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0019.png", "assets/images/sprites/punk/punk_death_0019.png");
		type.set ("assets/images/sprites/punk/punk_death_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0020.png", "assets/images/sprites/punk/punk_death_0020.png");
		type.set ("assets/images/sprites/punk/punk_death_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0021.png", "assets/images/sprites/punk/punk_death_0021.png");
		type.set ("assets/images/sprites/punk/punk_death_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0022.png", "assets/images/sprites/punk/punk_death_0022.png");
		type.set ("assets/images/sprites/punk/punk_death_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0023.png", "assets/images/sprites/punk/punk_death_0023.png");
		type.set ("assets/images/sprites/punk/punk_death_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0024.png", "assets/images/sprites/punk/punk_death_0024.png");
		type.set ("assets/images/sprites/punk/punk_death_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0025.png", "assets/images/sprites/punk/punk_death_0025.png");
		type.set ("assets/images/sprites/punk/punk_death_0025.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0026.png", "assets/images/sprites/punk/punk_death_0026.png");
		type.set ("assets/images/sprites/punk/punk_death_0026.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0027.png", "assets/images/sprites/punk/punk_death_0027.png");
		type.set ("assets/images/sprites/punk/punk_death_0027.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0028.png", "assets/images/sprites/punk/punk_death_0028.png");
		type.set ("assets/images/sprites/punk/punk_death_0028.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0029.png", "assets/images/sprites/punk/punk_death_0029.png");
		type.set ("assets/images/sprites/punk/punk_death_0029.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0030.png", "assets/images/sprites/punk/punk_death_0030.png");
		type.set ("assets/images/sprites/punk/punk_death_0030.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0031.png", "assets/images/sprites/punk/punk_death_0031.png");
		type.set ("assets/images/sprites/punk/punk_death_0031.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0032.png", "assets/images/sprites/punk/punk_death_0032.png");
		type.set ("assets/images/sprites/punk/punk_death_0032.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0033.png", "assets/images/sprites/punk/punk_death_0033.png");
		type.set ("assets/images/sprites/punk/punk_death_0033.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0034.png", "assets/images/sprites/punk/punk_death_0034.png");
		type.set ("assets/images/sprites/punk/punk_death_0034.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0035.png", "assets/images/sprites/punk/punk_death_0035.png");
		type.set ("assets/images/sprites/punk/punk_death_0035.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0036.png", "assets/images/sprites/punk/punk_death_0036.png");
		type.set ("assets/images/sprites/punk/punk_death_0036.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0037.png", "assets/images/sprites/punk/punk_death_0037.png");
		type.set ("assets/images/sprites/punk/punk_death_0037.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0038.png", "assets/images/sprites/punk/punk_death_0038.png");
		type.set ("assets/images/sprites/punk/punk_death_0038.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0039.png", "assets/images/sprites/punk/punk_death_0039.png");
		type.set ("assets/images/sprites/punk/punk_death_0039.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0040.png", "assets/images/sprites/punk/punk_death_0040.png");
		type.set ("assets/images/sprites/punk/punk_death_0040.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0041.png", "assets/images/sprites/punk/punk_death_0041.png");
		type.set ("assets/images/sprites/punk/punk_death_0041.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0042.png", "assets/images/sprites/punk/punk_death_0042.png");
		type.set ("assets/images/sprites/punk/punk_death_0042.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0043.png", "assets/images/sprites/punk/punk_death_0043.png");
		type.set ("assets/images/sprites/punk/punk_death_0043.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0044.png", "assets/images/sprites/punk/punk_death_0044.png");
		type.set ("assets/images/sprites/punk/punk_death_0044.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0045.png", "assets/images/sprites/punk/punk_death_0045.png");
		type.set ("assets/images/sprites/punk/punk_death_0045.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0046.png", "assets/images/sprites/punk/punk_death_0046.png");
		type.set ("assets/images/sprites/punk/punk_death_0046.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0001.png", "assets/images/sprites/punk/punk_idle_0001.png");
		type.set ("assets/images/sprites/punk/punk_idle_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0002.png", "assets/images/sprites/punk/punk_idle_0002.png");
		type.set ("assets/images/sprites/punk/punk_idle_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0003.png", "assets/images/sprites/punk/punk_idle_0003.png");
		type.set ("assets/images/sprites/punk/punk_idle_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0004.png", "assets/images/sprites/punk/punk_idle_0004.png");
		type.set ("assets/images/sprites/punk/punk_idle_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0005.png", "assets/images/sprites/punk/punk_idle_0005.png");
		type.set ("assets/images/sprites/punk/punk_idle_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0006.png", "assets/images/sprites/punk/punk_idle_0006.png");
		type.set ("assets/images/sprites/punk/punk_idle_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0007.png", "assets/images/sprites/punk/punk_idle_0007.png");
		type.set ("assets/images/sprites/punk/punk_idle_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0008.png", "assets/images/sprites/punk/punk_idle_0008.png");
		type.set ("assets/images/sprites/punk/punk_idle_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0009.png", "assets/images/sprites/punk/punk_idle_0009.png");
		type.set ("assets/images/sprites/punk/punk_idle_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0010.png", "assets/images/sprites/punk/punk_idle_0010.png");
		type.set ("assets/images/sprites/punk/punk_idle_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0011.png", "assets/images/sprites/punk/punk_idle_0011.png");
		type.set ("assets/images/sprites/punk/punk_idle_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0012.png", "assets/images/sprites/punk/punk_idle_0012.png");
		type.set ("assets/images/sprites/punk/punk_idle_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0013.png", "assets/images/sprites/punk/punk_idle_0013.png");
		type.set ("assets/images/sprites/punk/punk_idle_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0014.png", "assets/images/sprites/punk/punk_idle_0014.png");
		type.set ("assets/images/sprites/punk/punk_idle_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0015.png", "assets/images/sprites/punk/punk_idle_0015.png");
		type.set ("assets/images/sprites/punk/punk_idle_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0016.png", "assets/images/sprites/punk/punk_idle_0016.png");
		type.set ("assets/images/sprites/punk/punk_idle_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0017.png", "assets/images/sprites/punk/punk_idle_0017.png");
		type.set ("assets/images/sprites/punk/punk_idle_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0018.png", "assets/images/sprites/punk/punk_idle_0018.png");
		type.set ("assets/images/sprites/punk/punk_idle_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0019.png", "assets/images/sprites/punk/punk_idle_0019.png");
		type.set ("assets/images/sprites/punk/punk_idle_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0020.png", "assets/images/sprites/punk/punk_idle_0020.png");
		type.set ("assets/images/sprites/punk/punk_idle_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0021.png", "assets/images/sprites/punk/punk_idle_0021.png");
		type.set ("assets/images/sprites/punk/punk_idle_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0022.png", "assets/images/sprites/punk/punk_idle_0022.png");
		type.set ("assets/images/sprites/punk/punk_idle_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0023.png", "assets/images/sprites/punk/punk_idle_0023.png");
		type.set ("assets/images/sprites/punk/punk_idle_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0024.png", "assets/images/sprites/punk/punk_idle_0024.png");
		type.set ("assets/images/sprites/punk/punk_idle_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0025.png", "assets/images/sprites/punk/punk_idle_0025.png");
		type.set ("assets/images/sprites/punk/punk_idle_0025.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0001.png", "assets/images/sprites/punk/punk_jumpDown_0001.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0002.png", "assets/images/sprites/punk/punk_jumpDown_0002.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0003.png", "assets/images/sprites/punk/punk_jumpDown_0003.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0004.png", "assets/images/sprites/punk/punk_jumpDown_0004.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0005.png", "assets/images/sprites/punk/punk_jumpDown_0005.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0006.png", "assets/images/sprites/punk/punk_jumpDown_0006.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_walljump_0001.png", "assets/images/sprites/punk/punk_walljump_0001.png");
		type.set ("assets/images/sprites/punk/punk_walljump_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0001.png", "assets/images/sprites/punk/runPunk_0001.png");
		type.set ("assets/images/sprites/punk/runPunk_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0002.png", "assets/images/sprites/punk/runPunk_0002.png");
		type.set ("assets/images/sprites/punk/runPunk_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0003.png", "assets/images/sprites/punk/runPunk_0003.png");
		type.set ("assets/images/sprites/punk/runPunk_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0004.png", "assets/images/sprites/punk/runPunk_0004.png");
		type.set ("assets/images/sprites/punk/runPunk_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0005.png", "assets/images/sprites/punk/runPunk_0005.png");
		type.set ("assets/images/sprites/punk/runPunk_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0006.png", "assets/images/sprites/punk/runPunk_0006.png");
		type.set ("assets/images/sprites/punk/runPunk_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0007.png", "assets/images/sprites/punk/runPunk_0007.png");
		type.set ("assets/images/sprites/punk/runPunk_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0008.png", "assets/images/sprites/punk/runPunk_0008.png");
		type.set ("assets/images/sprites/punk/runPunk_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0009.png", "assets/images/sprites/punk/runPunk_0009.png");
		type.set ("assets/images/sprites/punk/runPunk_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0010.png", "assets/images/sprites/punk/runPunk_0010.png");
		type.set ("assets/images/sprites/punk/runPunk_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0011.png", "assets/images/sprites/punk/runPunk_0011.png");
		type.set ("assets/images/sprites/punk/runPunk_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0012.png", "assets/images/sprites/punk/runPunk_0012.png");
		type.set ("assets/images/sprites/punk/runPunk_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0013.png", "assets/images/sprites/punk/runPunk_0013.png");
		type.set ("assets/images/sprites/punk/runPunk_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0014.png", "assets/images/sprites/punk/runPunk_0014.png");
		type.set ("assets/images/sprites/punk/runPunk_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0015.png", "assets/images/sprites/punk/runPunk_0015.png");
		type.set ("assets/images/sprites/punk/runPunk_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0016.png", "assets/images/sprites/punk/runPunk_0016.png");
		type.set ("assets/images/sprites/punk/runPunk_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0017.png", "assets/images/sprites/punk/runPunk_0017.png");
		type.set ("assets/images/sprites/punk/runPunk_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0018.png", "assets/images/sprites/punk/runPunk_0018.png");
		type.set ("assets/images/sprites/punk/runPunk_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0019.png", "assets/images/sprites/punk/runPunk_0019.png");
		type.set ("assets/images/sprites/punk/runPunk_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0020.png", "assets/images/sprites/punk/runPunk_0020.png");
		type.set ("assets/images/sprites/punk/runPunk_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0021.png", "assets/images/sprites/punk/runPunk_0021.png");
		type.set ("assets/images/sprites/punk/runPunk_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0022.png", "assets/images/sprites/punk/runPunk_0022.png");
		type.set ("assets/images/sprites/punk/runPunk_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0023.png", "assets/images/sprites/punk/runPunk_0023.png");
		type.set ("assets/images/sprites/punk/runPunk_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0024.png", "assets/images/sprites/punk/runPunk_0024.png");
		type.set ("assets/images/sprites/punk/runPunk_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0001.png", "assets/images/sprites/pUps/bombo_big_load_0001.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0002.png", "assets/images/sprites/pUps/bombo_big_load_0002.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0003.png", "assets/images/sprites/pUps/bombo_big_load_0003.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0004.png", "assets/images/sprites/pUps/bombo_big_load_0004.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0005.png", "assets/images/sprites/pUps/bombo_big_load_0005.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0006.png", "assets/images/sprites/pUps/bombo_big_load_0006.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0007.png", "assets/images/sprites/pUps/bombo_big_load_0007.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0008.png", "assets/images/sprites/pUps/bombo_big_load_0008.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bomb_big_white_0001.png", "assets/images/sprites/pUps/bomb_big_white_0001.png");
		type.set ("assets/images/sprites/pUps/bomb_big_white_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bomb_big_white_0002.png", "assets/images/sprites/pUps/bomb_big_white_0002.png");
		type.set ("assets/images/sprites/pUps/bomb_big_white_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/Crate.png", "assets/images/sprites/pUps/Crate.png");
		type.set ("assets/images/sprites/pUps/Crate.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0001.png", "assets/images/sprites/pUps/explosion_0001.png");
		type.set ("assets/images/sprites/pUps/explosion_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0002.png", "assets/images/sprites/pUps/explosion_0002.png");
		type.set ("assets/images/sprites/pUps/explosion_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0003.png", "assets/images/sprites/pUps/explosion_0003.png");
		type.set ("assets/images/sprites/pUps/explosion_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0004.png", "assets/images/sprites/pUps/explosion_0004.png");
		type.set ("assets/images/sprites/pUps/explosion_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0005.png", "assets/images/sprites/pUps/explosion_0005.png");
		type.set ("assets/images/sprites/pUps/explosion_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0006.png", "assets/images/sprites/pUps/explosion_0006.png");
		type.set ("assets/images/sprites/pUps/explosion_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0007.png", "assets/images/sprites/pUps/explosion_0007.png");
		type.set ("assets/images/sprites/pUps/explosion_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0008.png", "assets/images/sprites/pUps/explosion_0008.png");
		type.set ("assets/images/sprites/pUps/explosion_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0009.png", "assets/images/sprites/pUps/explosion_0009.png");
		type.set ("assets/images/sprites/pUps/explosion_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0010.png", "assets/images/sprites/pUps/explosion_0010.png");
		type.set ("assets/images/sprites/pUps/explosion_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0011.png", "assets/images/sprites/pUps/explosion_0011.png");
		type.set ("assets/images/sprites/pUps/explosion_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0012.png", "assets/images/sprites/pUps/explosion_0012.png");
		type.set ("assets/images/sprites/pUps/explosion_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0013.png", "assets/images/sprites/pUps/explosion_0013.png");
		type.set ("assets/images/sprites/pUps/explosion_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0014.png", "assets/images/sprites/pUps/explosion_0014.png");
		type.set ("assets/images/sprites/pUps/explosion_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0015.png", "assets/images/sprites/pUps/explosion_0015.png");
		type.set ("assets/images/sprites/pUps/explosion_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0016.png", "assets/images/sprites/pUps/explosion_0016.png");
		type.set ("assets/images/sprites/pUps/explosion_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0017.png", "assets/images/sprites/pUps/explosion_0017.png");
		type.set ("assets/images/sprites/pUps/explosion_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0018.png", "assets/images/sprites/pUps/explosion_0018.png");
		type.set ("assets/images/sprites/pUps/explosion_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0019.png", "assets/images/sprites/pUps/explosion_0019.png");
		type.set ("assets/images/sprites/pUps/explosion_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0020.png", "assets/images/sprites/pUps/explosion_0020.png");
		type.set ("assets/images/sprites/pUps/explosion_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0021.png", "assets/images/sprites/pUps/explosion_0021.png");
		type.set ("assets/images/sprites/pUps/explosion_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0022.png", "assets/images/sprites/pUps/explosion_0022.png");
		type.set ("assets/images/sprites/pUps/explosion_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0023.png", "assets/images/sprites/pUps/explosion_0023.png");
		type.set ("assets/images/sprites/pUps/explosion_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0024.png", "assets/images/sprites/pUps/explosion_0024.png");
		type.set ("assets/images/sprites/pUps/explosion_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0025.png", "assets/images/sprites/pUps/explosion_0025.png");
		type.set ("assets/images/sprites/pUps/explosion_0025.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0026.png", "assets/images/sprites/pUps/explosion_0026.png");
		type.set ("assets/images/sprites/pUps/explosion_0026.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0027.png", "assets/images/sprites/pUps/explosion_0027.png");
		type.set ("assets/images/sprites/pUps/explosion_0027.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0028.png", "assets/images/sprites/pUps/explosion_0028.png");
		type.set ("assets/images/sprites/pUps/explosion_0028.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0029.png", "assets/images/sprites/pUps/explosion_0029.png");
		type.set ("assets/images/sprites/pUps/explosion_0029.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0030.png", "assets/images/sprites/pUps/explosion_0030.png");
		type.set ("assets/images/sprites/pUps/explosion_0030.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0031.png", "assets/images/sprites/pUps/explosion_0031.png");
		type.set ("assets/images/sprites/pUps/explosion_0031.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0032.png", "assets/images/sprites/pUps/explosion_0032.png");
		type.set ("assets/images/sprites/pUps/explosion_0032.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0033.png", "assets/images/sprites/pUps/explosion_0033.png");
		type.set ("assets/images/sprites/pUps/explosion_0033.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0034.png", "assets/images/sprites/pUps/explosion_0034.png");
		type.set ("assets/images/sprites/pUps/explosion_0034.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0035.png", "assets/images/sprites/pUps/explosion_0035.png");
		type.set ("assets/images/sprites/pUps/explosion_0035.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0036.png", "assets/images/sprites/pUps/explosion_0036.png");
		type.set ("assets/images/sprites/pUps/explosion_0036.png", AssetType.IMAGE);
		path.set ("assets/images/spritesheetTp.png", "assets/images/spritesheetTp.png");
		type.set ("assets/images/spritesheetTp.png", AssetType.IMAGE);
		path.set ("assets/images/tile01.png", "assets/images/tile01.png");
		type.set ("assets/images/tile01.png", AssetType.IMAGE);
		path.set ("assets/images/towerfall_test2_002.png", "assets/images/towerfall_test2_002.png");
		type.set ("assets/images/towerfall_test2_002.png", AssetType.IMAGE);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/clash.mp3", "assets/sounds/clash.mp3");
		type.set ("assets/sounds/clash.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/clash.ogg", "assets/sounds/clash.ogg");
		type.set ("assets/sounds/clash.ogg", AssetType.SOUND);
		path.set ("assets/sounds/explode.ogg", "assets/sounds/explode.ogg");
		type.set ("assets/sounds/explode.ogg", AssetType.SOUND);
		path.set ("assets/sounds/explodemini.wav", "assets/sounds/explodemini.wav");
		type.set ("assets/sounds/explodemini.wav", AssetType.SOUND);
		path.set ("assets/sounds/hurt.mp3", "assets/sounds/hurt.mp3");
		type.set ("assets/sounds/hurt.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/hurt.ogg", "assets/sounds/hurt.ogg");
		type.set ("assets/sounds/hurt.ogg", AssetType.SOUND);
		path.set ("assets/sounds/slash.mp3", "assets/sounds/slash.mp3");
		type.set ("assets/sounds/slash.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/slash.ogg", "assets/sounds/slash.ogg");
		type.set ("assets/sounds/slash.ogg", AssetType.SOUND);
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		path.set ("clash", "assets/sounds/clash.ogg");
		type.set ("clash", AssetType.SOUND);
		path.set ("slash", "assets/sounds/slash.ogg");
		type.set ("slash", AssetType.SOUND);
		path.set ("hurt", "assets/sounds/hurt.ogg");
		type.set ("hurt", AssetType.SOUND);
		path.set ("explode", "assets/sounds/explode.ogg");
		type.set ("explode", AssetType.SOUND);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/big version.dam";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/big version.dam.bak";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/mapCSV_Group1_Map1.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/megaversion.dam";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/megaversion.dam.bak";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/megaversion3.dam";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/spritesData.json";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/texture.tps";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/textureNew.tps";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/textureWithFolders.tps";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/charLight.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cityCartoon_01.swf";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/conceptLab.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/ligth.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/marco.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/piedritas.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sceneLightBlue.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0025.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0026.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0027.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0028.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0029.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0030.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0031.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0032.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0033.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0034.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0035.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0036.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0037.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0038.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0039.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0040.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0041.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0042.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0043.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0044.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0045.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0046.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0025.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashGunTrailEXPORT.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashTrailExport.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_dash_.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0025.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0026.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0027.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0028.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0029.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0030.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0031.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0032.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0033.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0034.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0035.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0036.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0037.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0038.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0039.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0040.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0041.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0042.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0043.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0044.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0045.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0046.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0025.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_walljump_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bomb_big_white_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bomb_big_white_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/Crate.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0025.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0026.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0027.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0028.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0029.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0030.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0031.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0032.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0033.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0034.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0035.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0036.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/spritesheetTp.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tile01.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/towerfall_test2_002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/clash.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/clash.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/explode.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/explodemini.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/hurt.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/hurt.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/slash.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/slash.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "clash";
		path.set (id, "assets/sounds/clash.ogg");
		type.set (id, AssetType.SOUND);
		id = "slash";
		path.set (id, "assets/sounds/slash.ogg");
		type.set (id, AssetType.SOUND);
		id = "hurt";
		path.set (id, "assets/sounds/hurt.ogg");
		type.set (id, AssetType.SOUND);
		id = "explode";
		path.set (id, "assets/sounds/explode.ogg");
		type.set (id, AssetType.SOUND);
		
		
		#else
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);

		#elseif (js || openfl_html5 || pixi)
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash



































































































































































































































































































































































































































































































































































































#elseif html5



































































































































































































































































































































































































































































































































































































#else

#if (windows || mac || linux)







#else




#end

#end


#else


package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("assets/data/big version.dam", "assets/data/big version.dam");
		type.set ("assets/data/big version.dam", AssetType.TEXT);
		path.set ("assets/data/big version.dam.bak", "assets/data/big version.dam.bak");
		type.set ("assets/data/big version.dam.bak", AssetType.TEXT);
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		path.set ("assets/data/mapCSV_Group1_Map1.csv", "assets/data/mapCSV_Group1_Map1.csv");
		type.set ("assets/data/mapCSV_Group1_Map1.csv", AssetType.TEXT);
		path.set ("assets/data/megaversion.dam", "assets/data/megaversion.dam");
		type.set ("assets/data/megaversion.dam", AssetType.TEXT);
		path.set ("assets/data/megaversion.dam.bak", "assets/data/megaversion.dam.bak");
		type.set ("assets/data/megaversion.dam.bak", AssetType.TEXT);
		path.set ("assets/data/megaversion3.dam", "assets/data/megaversion3.dam");
		type.set ("assets/data/megaversion3.dam", AssetType.TEXT);
		path.set ("assets/data/spritesData.json", "assets/data/spritesData.json");
		type.set ("assets/data/spritesData.json", AssetType.TEXT);
		path.set ("assets/data/texture.tps", "assets/data/texture.tps");
		type.set ("assets/data/texture.tps", AssetType.TEXT);
		path.set ("assets/data/textureNew.tps", "assets/data/textureNew.tps");
		type.set ("assets/data/textureNew.tps", AssetType.TEXT);
		path.set ("assets/data/textureWithFolders.tps", "assets/data/textureWithFolders.tps");
		type.set ("assets/data/textureWithFolders.tps", AssetType.TEXT);
		path.set ("assets/images/1.png", "assets/images/1.png");
		type.set ("assets/images/1.png", AssetType.IMAGE);
		path.set ("assets/images/2.png", "assets/images/2.png");
		type.set ("assets/images/2.png", AssetType.IMAGE);
		path.set ("assets/images/charLight.png", "assets/images/charLight.png");
		type.set ("assets/images/charLight.png", AssetType.IMAGE);
		path.set ("assets/images/cityCartoon_01.swf", "assets/images/cityCartoon_01.swf");
		type.set ("assets/images/cityCartoon_01.swf", AssetType.TEXT);
		path.set ("assets/images/conceptLab.png", "assets/images/conceptLab.png");
		type.set ("assets/images/conceptLab.png", AssetType.IMAGE);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/images/ligth.png", "assets/images/ligth.png");
		type.set ("assets/images/ligth.png", AssetType.IMAGE);
		path.set ("assets/images/marco.png", "assets/images/marco.png");
		type.set ("assets/images/marco.png", AssetType.IMAGE);
		path.set ("assets/images/piedritas.png", "assets/images/piedritas.png");
		type.set ("assets/images/piedritas.png", AssetType.IMAGE);
		path.set ("assets/images/sceneLightBlue.png", "assets/images/sceneLightBlue.png");
		type.set ("assets/images/sceneLightBlue.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png", "assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png");
		type.set ("assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png", "assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png");
		type.set ("assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0001.png", "assets/images/sprites/chief/AirDeathExport0001.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0002.png", "assets/images/sprites/chief/AirDeathExport0002.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0003.png", "assets/images/sprites/chief/AirDeathExport0003.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0004.png", "assets/images/sprites/chief/AirDeathExport0004.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0005.png", "assets/images/sprites/chief/AirDeathExport0005.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0006.png", "assets/images/sprites/chief/AirDeathExport0006.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0007.png", "assets/images/sprites/chief/AirDeathExport0007.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0008.png", "assets/images/sprites/chief/AirDeathExport0008.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0009.png", "assets/images/sprites/chief/AirDeathExport0009.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0010.png", "assets/images/sprites/chief/AirDeathExport0010.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0011.png", "assets/images/sprites/chief/AirDeathExport0011.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0012.png", "assets/images/sprites/chief/AirDeathExport0012.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0013.png", "assets/images/sprites/chief/AirDeathExport0013.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0014.png", "assets/images/sprites/chief/AirDeathExport0014.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0015.png", "assets/images/sprites/chief/AirDeathExport0015.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0016.png", "assets/images/sprites/chief/AirDeathExport0016.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0017.png", "assets/images/sprites/chief/AirDeathExport0017.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0018.png", "assets/images/sprites/chief/AirDeathExport0018.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0019.png", "assets/images/sprites/chief/AirDeathExport0019.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0020.png", "assets/images/sprites/chief/AirDeathExport0020.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0021.png", "assets/images/sprites/chief/AirDeathExport0021.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0022.png", "assets/images/sprites/chief/AirDeathExport0022.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0023.png", "assets/images/sprites/chief/AirDeathExport0023.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0024.png", "assets/images/sprites/chief/AirDeathExport0024.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0025.png", "assets/images/sprites/chief/AirDeathExport0025.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0025.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0026.png", "assets/images/sprites/chief/AirDeathExport0026.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0026.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0027.png", "assets/images/sprites/chief/AirDeathExport0027.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0027.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0028.png", "assets/images/sprites/chief/AirDeathExport0028.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0028.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0029.png", "assets/images/sprites/chief/AirDeathExport0029.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0029.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0030.png", "assets/images/sprites/chief/AirDeathExport0030.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0030.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0031.png", "assets/images/sprites/chief/AirDeathExport0031.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0031.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0032.png", "assets/images/sprites/chief/AirDeathExport0032.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0032.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0033.png", "assets/images/sprites/chief/AirDeathExport0033.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0033.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0034.png", "assets/images/sprites/chief/AirDeathExport0034.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0034.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0035.png", "assets/images/sprites/chief/AirDeathExport0035.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0035.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0036.png", "assets/images/sprites/chief/AirDeathExport0036.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0036.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0037.png", "assets/images/sprites/chief/AirDeathExport0037.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0037.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0038.png", "assets/images/sprites/chief/AirDeathExport0038.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0038.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0039.png", "assets/images/sprites/chief/AirDeathExport0039.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0039.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0040.png", "assets/images/sprites/chief/AirDeathExport0040.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0040.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0041.png", "assets/images/sprites/chief/AirDeathExport0041.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0041.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0042.png", "assets/images/sprites/chief/AirDeathExport0042.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0042.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0043.png", "assets/images/sprites/chief/AirDeathExport0043.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0043.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0044.png", "assets/images/sprites/chief/AirDeathExport0044.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0044.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0045.png", "assets/images/sprites/chief/AirDeathExport0045.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0045.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/AirDeathExport0046.png", "assets/images/sprites/chief/AirDeathExport0046.png");
		type.set ("assets/images/sprites/chief/AirDeathExport0046.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0001.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0001.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0002.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0002.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0003.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0003.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0004.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0004.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0005.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0005.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0006.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0006.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0007.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0007.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0008.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0008.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0009.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0009.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0010.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0010.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0011.png", "assets/images/sprites/chief/Chief_CoverNoBallExport0011.png");
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0001.png", "assets/images/sprites/chief/IdleExport0001.png");
		type.set ("assets/images/sprites/chief/IdleExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0002.png", "assets/images/sprites/chief/IdleExport0002.png");
		type.set ("assets/images/sprites/chief/IdleExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0003.png", "assets/images/sprites/chief/IdleExport0003.png");
		type.set ("assets/images/sprites/chief/IdleExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0004.png", "assets/images/sprites/chief/IdleExport0004.png");
		type.set ("assets/images/sprites/chief/IdleExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0005.png", "assets/images/sprites/chief/IdleExport0005.png");
		type.set ("assets/images/sprites/chief/IdleExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0006.png", "assets/images/sprites/chief/IdleExport0006.png");
		type.set ("assets/images/sprites/chief/IdleExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0007.png", "assets/images/sprites/chief/IdleExport0007.png");
		type.set ("assets/images/sprites/chief/IdleExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0008.png", "assets/images/sprites/chief/IdleExport0008.png");
		type.set ("assets/images/sprites/chief/IdleExport0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0009.png", "assets/images/sprites/chief/IdleExport0009.png");
		type.set ("assets/images/sprites/chief/IdleExport0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0010.png", "assets/images/sprites/chief/IdleExport0010.png");
		type.set ("assets/images/sprites/chief/IdleExport0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0011.png", "assets/images/sprites/chief/IdleExport0011.png");
		type.set ("assets/images/sprites/chief/IdleExport0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0012.png", "assets/images/sprites/chief/IdleExport0012.png");
		type.set ("assets/images/sprites/chief/IdleExport0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0013.png", "assets/images/sprites/chief/IdleExport0013.png");
		type.set ("assets/images/sprites/chief/IdleExport0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0014.png", "assets/images/sprites/chief/IdleExport0014.png");
		type.set ("assets/images/sprites/chief/IdleExport0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0015.png", "assets/images/sprites/chief/IdleExport0015.png");
		type.set ("assets/images/sprites/chief/IdleExport0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0016.png", "assets/images/sprites/chief/IdleExport0016.png");
		type.set ("assets/images/sprites/chief/IdleExport0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0017.png", "assets/images/sprites/chief/IdleExport0017.png");
		type.set ("assets/images/sprites/chief/IdleExport0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0018.png", "assets/images/sprites/chief/IdleExport0018.png");
		type.set ("assets/images/sprites/chief/IdleExport0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0019.png", "assets/images/sprites/chief/IdleExport0019.png");
		type.set ("assets/images/sprites/chief/IdleExport0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0020.png", "assets/images/sprites/chief/IdleExport0020.png");
		type.set ("assets/images/sprites/chief/IdleExport0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0021.png", "assets/images/sprites/chief/IdleExport0021.png");
		type.set ("assets/images/sprites/chief/IdleExport0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0022.png", "assets/images/sprites/chief/IdleExport0022.png");
		type.set ("assets/images/sprites/chief/IdleExport0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0023.png", "assets/images/sprites/chief/IdleExport0023.png");
		type.set ("assets/images/sprites/chief/IdleExport0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0024.png", "assets/images/sprites/chief/IdleExport0024.png");
		type.set ("assets/images/sprites/chief/IdleExport0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/IdleExport0025.png", "assets/images/sprites/chief/IdleExport0025.png");
		type.set ("assets/images/sprites/chief/IdleExport0025.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0001.png", "assets/images/sprites/chief/JumpDownExport0001.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0002.png", "assets/images/sprites/chief/JumpDownExport0002.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0003.png", "assets/images/sprites/chief/JumpDownExport0003.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0004.png", "assets/images/sprites/chief/JumpDownExport0004.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0005.png", "assets/images/sprites/chief/JumpDownExport0005.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpDownExport0006.png", "assets/images/sprites/chief/JumpDownExport0006.png");
		type.set ("assets/images/sprites/chief/JumpDownExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0001.png", "assets/images/sprites/chief/JumpFallExport0001.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0002.png", "assets/images/sprites/chief/JumpFallExport0002.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0003.png", "assets/images/sprites/chief/JumpFallExport0003.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0004.png", "assets/images/sprites/chief/JumpFallExport0004.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0005.png", "assets/images/sprites/chief/JumpFallExport0005.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpFallExport0006.png", "assets/images/sprites/chief/JumpFallExport0006.png");
		type.set ("assets/images/sprites/chief/JumpFallExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0001.png", "assets/images/sprites/chief/JumpUpExport0001.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0002.png", "assets/images/sprites/chief/JumpUpExport0002.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0003.png", "assets/images/sprites/chief/JumpUpExport0003.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0004.png", "assets/images/sprites/chief/JumpUpExport0004.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0005.png", "assets/images/sprites/chief/JumpUpExport0005.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0006.png", "assets/images/sprites/chief/JumpUpExport0006.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/JumpUpExport0007.png", "assets/images/sprites/chief/JumpUpExport0007.png");
		type.set ("assets/images/sprites/chief/JumpUpExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0001.png", "assets/images/sprites/chief/run2Export0001.png");
		type.set ("assets/images/sprites/chief/run2Export0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0002.png", "assets/images/sprites/chief/run2Export0002.png");
		type.set ("assets/images/sprites/chief/run2Export0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0003.png", "assets/images/sprites/chief/run2Export0003.png");
		type.set ("assets/images/sprites/chief/run2Export0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0004.png", "assets/images/sprites/chief/run2Export0004.png");
		type.set ("assets/images/sprites/chief/run2Export0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0005.png", "assets/images/sprites/chief/run2Export0005.png");
		type.set ("assets/images/sprites/chief/run2Export0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0006.png", "assets/images/sprites/chief/run2Export0006.png");
		type.set ("assets/images/sprites/chief/run2Export0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0007.png", "assets/images/sprites/chief/run2Export0007.png");
		type.set ("assets/images/sprites/chief/run2Export0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0008.png", "assets/images/sprites/chief/run2Export0008.png");
		type.set ("assets/images/sprites/chief/run2Export0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0009.png", "assets/images/sprites/chief/run2Export0009.png");
		type.set ("assets/images/sprites/chief/run2Export0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0010.png", "assets/images/sprites/chief/run2Export0010.png");
		type.set ("assets/images/sprites/chief/run2Export0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0011.png", "assets/images/sprites/chief/run2Export0011.png");
		type.set ("assets/images/sprites/chief/run2Export0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0012.png", "assets/images/sprites/chief/run2Export0012.png");
		type.set ("assets/images/sprites/chief/run2Export0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0013.png", "assets/images/sprites/chief/run2Export0013.png");
		type.set ("assets/images/sprites/chief/run2Export0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0014.png", "assets/images/sprites/chief/run2Export0014.png");
		type.set ("assets/images/sprites/chief/run2Export0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0015.png", "assets/images/sprites/chief/run2Export0015.png");
		type.set ("assets/images/sprites/chief/run2Export0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0016.png", "assets/images/sprites/chief/run2Export0016.png");
		type.set ("assets/images/sprites/chief/run2Export0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0017.png", "assets/images/sprites/chief/run2Export0017.png");
		type.set ("assets/images/sprites/chief/run2Export0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0018.png", "assets/images/sprites/chief/run2Export0018.png");
		type.set ("assets/images/sprites/chief/run2Export0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0019.png", "assets/images/sprites/chief/run2Export0019.png");
		type.set ("assets/images/sprites/chief/run2Export0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0020.png", "assets/images/sprites/chief/run2Export0020.png");
		type.set ("assets/images/sprites/chief/run2Export0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0021.png", "assets/images/sprites/chief/run2Export0021.png");
		type.set ("assets/images/sprites/chief/run2Export0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0022.png", "assets/images/sprites/chief/run2Export0022.png");
		type.set ("assets/images/sprites/chief/run2Export0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/run2Export0023.png", "assets/images/sprites/chief/run2Export0023.png");
		type.set ("assets/images/sprites/chief/run2Export0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0001.png", "assets/images/sprites/chief/sword_floorDown0001.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0002.png", "assets/images/sprites/chief/sword_floorDown0002.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0003.png", "assets/images/sprites/chief/sword_floorDown0003.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0004.png", "assets/images/sprites/chief/sword_floorDown0004.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0005.png", "assets/images/sprites/chief/sword_floorDown0005.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0006.png", "assets/images/sprites/chief/sword_floorDown0006.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0007.png", "assets/images/sprites/chief/sword_floorDown0007.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0008.png", "assets/images/sprites/chief/sword_floorDown0008.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0009.png", "assets/images/sprites/chief/sword_floorDown0009.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0010.png", "assets/images/sprites/chief/sword_floorDown0010.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0011.png", "assets/images/sprites/chief/sword_floorDown0011.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0012.png", "assets/images/sprites/chief/sword_floorDown0012.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0013.png", "assets/images/sprites/chief/sword_floorDown0013.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0014.png", "assets/images/sprites/chief/sword_floorDown0014.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0015.png", "assets/images/sprites/chief/sword_floorDown0015.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0016.png", "assets/images/sprites/chief/sword_floorDown0016.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0017.png", "assets/images/sprites/chief/sword_floorDown0017.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0018.png", "assets/images/sprites/chief/sword_floorDown0018.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorDown0019.png", "assets/images/sprites/chief/sword_floorDown0019.png");
		type.set ("assets/images/sprites/chief/sword_floorDown0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0001.png", "assets/images/sprites/chief/sword_floorSideCutExport0001.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0002.png", "assets/images/sprites/chief/sword_floorSideCutExport0002.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0003.png", "assets/images/sprites/chief/sword_floorSideCutExport0003.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0004.png", "assets/images/sprites/chief/sword_floorSideCutExport0004.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0005.png", "assets/images/sprites/chief/sword_floorSideCutExport0005.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0006.png", "assets/images/sprites/chief/sword_floorSideCutExport0006.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0007.png", "assets/images/sprites/chief/sword_floorSideCutExport0007.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0008.png", "assets/images/sprites/chief/sword_floorSideCutExport0008.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0009.png", "assets/images/sprites/chief/sword_floorSideCutExport0009.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0010.png", "assets/images/sprites/chief/sword_floorSideCutExport0010.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0011.png", "assets/images/sprites/chief/sword_floorSideCutExport0011.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0012.png", "assets/images/sprites/chief/sword_floorSideCutExport0012.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorSideCutExport0013.png", "assets/images/sprites/chief/sword_floorSideCutExport0013.png");
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0001.png", "assets/images/sprites/chief/sword_floorUpExport0001.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0002.png", "assets/images/sprites/chief/sword_floorUpExport0002.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0003.png", "assets/images/sprites/chief/sword_floorUpExport0003.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0004.png", "assets/images/sprites/chief/sword_floorUpExport0004.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0005.png", "assets/images/sprites/chief/sword_floorUpExport0005.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0006.png", "assets/images/sprites/chief/sword_floorUpExport0006.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0007.png", "assets/images/sprites/chief/sword_floorUpExport0007.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0008.png", "assets/images/sprites/chief/sword_floorUpExport0008.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0009.png", "assets/images/sprites/chief/sword_floorUpExport0009.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0010.png", "assets/images/sprites/chief/sword_floorUpExport0010.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0011.png", "assets/images/sprites/chief/sword_floorUpExport0011.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0012.png", "assets/images/sprites/chief/sword_floorUpExport0012.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0013.png", "assets/images/sprites/chief/sword_floorUpExport0013.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0014.png", "assets/images/sprites/chief/sword_floorUpExport0014.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/sword_floorUpExport0015.png", "assets/images/sprites/chief/sword_floorUpExport0015.png");
		type.set ("assets/images/sprites/chief/sword_floorUpExport0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0001.png", "assets/images/sprites/chief/wallJumpOutExport0001.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0002.png", "assets/images/sprites/chief/wallJumpOutExport0002.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0003.png", "assets/images/sprites/chief/wallJumpOutExport0003.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0004.png", "assets/images/sprites/chief/wallJumpOutExport0004.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0005.png", "assets/images/sprites/chief/wallJumpOutExport0005.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/chief/wallJumpOutExport0006.png", "assets/images/sprites/chief/wallJumpOutExport0006.png");
		type.set ("assets/images/sprites/chief/wallJumpOutExport0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0001.png", "assets/images/sprites/FX/dashCloudEXPORT0001.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0002.png", "assets/images/sprites/FX/dashCloudEXPORT0002.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0003.png", "assets/images/sprites/FX/dashCloudEXPORT0003.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0004.png", "assets/images/sprites/FX/dashCloudEXPORT0004.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0005.png", "assets/images/sprites/FX/dashCloudEXPORT0005.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0006.png", "assets/images/sprites/FX/dashCloudEXPORT0006.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0007.png", "assets/images/sprites/FX/dashCloudEXPORT0007.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0008.png", "assets/images/sprites/FX/dashCloudEXPORT0008.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0009.png", "assets/images/sprites/FX/dashCloudEXPORT0009.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0010.png", "assets/images/sprites/FX/dashCloudEXPORT0010.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/dashCloudEXPORT0011.png", "assets/images/sprites/FX/dashCloudEXPORT0011.png");
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0001.png", "assets/images/sprites/FX/DashFloor1EXPORT0001.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0002.png", "assets/images/sprites/FX/DashFloor1EXPORT0002.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0003.png", "assets/images/sprites/FX/DashFloor1EXPORT0003.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0004.png", "assets/images/sprites/FX/DashFloor1EXPORT0004.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0005.png", "assets/images/sprites/FX/DashFloor1EXPORT0005.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0006.png", "assets/images/sprites/FX/DashFloor1EXPORT0006.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0007.png", "assets/images/sprites/FX/DashFloor1EXPORT0007.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashFloor1EXPORT0008.png", "assets/images/sprites/FX/DashFloor1EXPORT0008.png");
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashGunTrailEXPORT.png", "assets/images/sprites/FX/DashGunTrailEXPORT.png");
		type.set ("assets/images/sprites/FX/DashGunTrailEXPORT.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/DashTrailExport.png", "assets/images/sprites/FX/DashTrailExport.png");
		type.set ("assets/images/sprites/FX/DashTrailExport.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0001.png", "assets/images/sprites/FX/floorFall_0001.png");
		type.set ("assets/images/sprites/FX/floorFall_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0002.png", "assets/images/sprites/FX/floorFall_0002.png");
		type.set ("assets/images/sprites/FX/floorFall_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0003.png", "assets/images/sprites/FX/floorFall_0003.png");
		type.set ("assets/images/sprites/FX/floorFall_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0004.png", "assets/images/sprites/FX/floorFall_0004.png");
		type.set ("assets/images/sprites/FX/floorFall_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0005.png", "assets/images/sprites/FX/floorFall_0005.png");
		type.set ("assets/images/sprites/FX/floorFall_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0006.png", "assets/images/sprites/FX/floorFall_0006.png");
		type.set ("assets/images/sprites/FX/floorFall_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0007.png", "assets/images/sprites/FX/floorFall_0007.png");
		type.set ("assets/images/sprites/FX/floorFall_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0008.png", "assets/images/sprites/FX/floorFall_0008.png");
		type.set ("assets/images/sprites/FX/floorFall_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0009.png", "assets/images/sprites/FX/floorFall_0009.png");
		type.set ("assets/images/sprites/FX/floorFall_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0010.png", "assets/images/sprites/FX/floorFall_0010.png");
		type.set ("assets/images/sprites/FX/floorFall_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0011.png", "assets/images/sprites/FX/floorFall_0011.png");
		type.set ("assets/images/sprites/FX/floorFall_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0012.png", "assets/images/sprites/FX/floorFall_0012.png");
		type.set ("assets/images/sprites/FX/floorFall_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0013.png", "assets/images/sprites/FX/floorFall_0013.png");
		type.set ("assets/images/sprites/FX/floorFall_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0014.png", "assets/images/sprites/FX/floorFall_0014.png");
		type.set ("assets/images/sprites/FX/floorFall_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0015.png", "assets/images/sprites/FX/floorFall_0015.png");
		type.set ("assets/images/sprites/FX/floorFall_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0016.png", "assets/images/sprites/FX/floorFall_0016.png");
		type.set ("assets/images/sprites/FX/floorFall_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0017.png", "assets/images/sprites/FX/floorFall_0017.png");
		type.set ("assets/images/sprites/FX/floorFall_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0018.png", "assets/images/sprites/FX/floorFall_0018.png");
		type.set ("assets/images/sprites/FX/floorFall_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0019.png", "assets/images/sprites/FX/floorFall_0019.png");
		type.set ("assets/images/sprites/FX/floorFall_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0020.png", "assets/images/sprites/FX/floorFall_0020.png");
		type.set ("assets/images/sprites/FX/floorFall_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0021.png", "assets/images/sprites/FX/floorFall_0021.png");
		type.set ("assets/images/sprites/FX/floorFall_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_0022.png", "assets/images/sprites/FX/floorFall_0022.png");
		type.set ("assets/images/sprites/FX/floorFall_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0001.png", "assets/images/sprites/FX/floorFall_2_0001.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0002.png", "assets/images/sprites/FX/floorFall_2_0002.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0003.png", "assets/images/sprites/FX/floorFall_2_0003.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0004.png", "assets/images/sprites/FX/floorFall_2_0004.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0005.png", "assets/images/sprites/FX/floorFall_2_0005.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0006.png", "assets/images/sprites/FX/floorFall_2_0006.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0007.png", "assets/images/sprites/FX/floorFall_2_0007.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0008.png", "assets/images/sprites/FX/floorFall_2_0008.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0009.png", "assets/images/sprites/FX/floorFall_2_0009.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0010.png", "assets/images/sprites/FX/floorFall_2_0010.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0011.png", "assets/images/sprites/FX/floorFall_2_0011.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0012.png", "assets/images/sprites/FX/floorFall_2_0012.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0013.png", "assets/images/sprites/FX/floorFall_2_0013.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0014.png", "assets/images/sprites/FX/floorFall_2_0014.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0015.png", "assets/images/sprites/FX/floorFall_2_0015.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0016.png", "assets/images/sprites/FX/floorFall_2_0016.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0017.png", "assets/images/sprites/FX/floorFall_2_0017.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0018.png", "assets/images/sprites/FX/floorFall_2_0018.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0019.png", "assets/images/sprites/FX/floorFall_2_0019.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0020.png", "assets/images/sprites/FX/floorFall_2_0020.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0021.png", "assets/images/sprites/FX/floorFall_2_0021.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0022.png", "assets/images/sprites/FX/floorFall_2_0022.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0023.png", "assets/images/sprites/FX/floorFall_2_0023.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorFall_2_0024.png", "assets/images/sprites/FX/floorFall_2_0024.png");
		type.set ("assets/images/sprites/FX/floorFall_2_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0001.png", "assets/images/sprites/FX/floorJump1_0001.png");
		type.set ("assets/images/sprites/FX/floorJump1_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0002.png", "assets/images/sprites/FX/floorJump1_0002.png");
		type.set ("assets/images/sprites/FX/floorJump1_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0003.png", "assets/images/sprites/FX/floorJump1_0003.png");
		type.set ("assets/images/sprites/FX/floorJump1_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0004.png", "assets/images/sprites/FX/floorJump1_0004.png");
		type.set ("assets/images/sprites/FX/floorJump1_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0005.png", "assets/images/sprites/FX/floorJump1_0005.png");
		type.set ("assets/images/sprites/FX/floorJump1_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0006.png", "assets/images/sprites/FX/floorJump1_0006.png");
		type.set ("assets/images/sprites/FX/floorJump1_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0007.png", "assets/images/sprites/FX/floorJump1_0007.png");
		type.set ("assets/images/sprites/FX/floorJump1_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0008.png", "assets/images/sprites/FX/floorJump1_0008.png");
		type.set ("assets/images/sprites/FX/floorJump1_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0009.png", "assets/images/sprites/FX/floorJump1_0009.png");
		type.set ("assets/images/sprites/FX/floorJump1_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0010.png", "assets/images/sprites/FX/floorJump1_0010.png");
		type.set ("assets/images/sprites/FX/floorJump1_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0011.png", "assets/images/sprites/FX/floorJump1_0011.png");
		type.set ("assets/images/sprites/FX/floorJump1_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0012.png", "assets/images/sprites/FX/floorJump1_0012.png");
		type.set ("assets/images/sprites/FX/floorJump1_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0013.png", "assets/images/sprites/FX/floorJump1_0013.png");
		type.set ("assets/images/sprites/FX/floorJump1_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0014.png", "assets/images/sprites/FX/floorJump1_0014.png");
		type.set ("assets/images/sprites/FX/floorJump1_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0015.png", "assets/images/sprites/FX/floorJump1_0015.png");
		type.set ("assets/images/sprites/FX/floorJump1_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0016.png", "assets/images/sprites/FX/floorJump1_0016.png");
		type.set ("assets/images/sprites/FX/floorJump1_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0017.png", "assets/images/sprites/FX/floorJump1_0017.png");
		type.set ("assets/images/sprites/FX/floorJump1_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0018.png", "assets/images/sprites/FX/floorJump1_0018.png");
		type.set ("assets/images/sprites/FX/floorJump1_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0019.png", "assets/images/sprites/FX/floorJump1_0019.png");
		type.set ("assets/images/sprites/FX/floorJump1_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0020.png", "assets/images/sprites/FX/floorJump1_0020.png");
		type.set ("assets/images/sprites/FX/floorJump1_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0021.png", "assets/images/sprites/FX/floorJump1_0021.png");
		type.set ("assets/images/sprites/FX/floorJump1_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0022.png", "assets/images/sprites/FX/floorJump1_0022.png");
		type.set ("assets/images/sprites/FX/floorJump1_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0023.png", "assets/images/sprites/FX/floorJump1_0023.png");
		type.set ("assets/images/sprites/FX/floorJump1_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump1_0024.png", "assets/images/sprites/FX/floorJump1_0024.png");
		type.set ("assets/images/sprites/FX/floorJump1_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0001.png", "assets/images/sprites/FX/floorJump2_0001.png");
		type.set ("assets/images/sprites/FX/floorJump2_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0002.png", "assets/images/sprites/FX/floorJump2_0002.png");
		type.set ("assets/images/sprites/FX/floorJump2_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0003.png", "assets/images/sprites/FX/floorJump2_0003.png");
		type.set ("assets/images/sprites/FX/floorJump2_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0004.png", "assets/images/sprites/FX/floorJump2_0004.png");
		type.set ("assets/images/sprites/FX/floorJump2_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0005.png", "assets/images/sprites/FX/floorJump2_0005.png");
		type.set ("assets/images/sprites/FX/floorJump2_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0006.png", "assets/images/sprites/FX/floorJump2_0006.png");
		type.set ("assets/images/sprites/FX/floorJump2_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0007.png", "assets/images/sprites/FX/floorJump2_0007.png");
		type.set ("assets/images/sprites/FX/floorJump2_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0008.png", "assets/images/sprites/FX/floorJump2_0008.png");
		type.set ("assets/images/sprites/FX/floorJump2_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0009.png", "assets/images/sprites/FX/floorJump2_0009.png");
		type.set ("assets/images/sprites/FX/floorJump2_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0010.png", "assets/images/sprites/FX/floorJump2_0010.png");
		type.set ("assets/images/sprites/FX/floorJump2_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0011.png", "assets/images/sprites/FX/floorJump2_0011.png");
		type.set ("assets/images/sprites/FX/floorJump2_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0012.png", "assets/images/sprites/FX/floorJump2_0012.png");
		type.set ("assets/images/sprites/FX/floorJump2_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0013.png", "assets/images/sprites/FX/floorJump2_0013.png");
		type.set ("assets/images/sprites/FX/floorJump2_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0014.png", "assets/images/sprites/FX/floorJump2_0014.png");
		type.set ("assets/images/sprites/FX/floorJump2_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0015.png", "assets/images/sprites/FX/floorJump2_0015.png");
		type.set ("assets/images/sprites/FX/floorJump2_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0016.png", "assets/images/sprites/FX/floorJump2_0016.png");
		type.set ("assets/images/sprites/FX/floorJump2_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0017.png", "assets/images/sprites/FX/floorJump2_0017.png");
		type.set ("assets/images/sprites/FX/floorJump2_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0018.png", "assets/images/sprites/FX/floorJump2_0018.png");
		type.set ("assets/images/sprites/FX/floorJump2_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/floorJump2_0019.png", "assets/images/sprites/FX/floorJump2_0019.png");
		type.set ("assets/images/sprites/FX/floorJump2_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0001.png", "assets/images/sprites/FX/fx_run_0001.png");
		type.set ("assets/images/sprites/FX/fx_run_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0002.png", "assets/images/sprites/FX/fx_run_0002.png");
		type.set ("assets/images/sprites/FX/fx_run_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0003.png", "assets/images/sprites/FX/fx_run_0003.png");
		type.set ("assets/images/sprites/FX/fx_run_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0004.png", "assets/images/sprites/FX/fx_run_0004.png");
		type.set ("assets/images/sprites/FX/fx_run_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0005.png", "assets/images/sprites/FX/fx_run_0005.png");
		type.set ("assets/images/sprites/FX/fx_run_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0006.png", "assets/images/sprites/FX/fx_run_0006.png");
		type.set ("assets/images/sprites/FX/fx_run_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0007.png", "assets/images/sprites/FX/fx_run_0007.png");
		type.set ("assets/images/sprites/FX/fx_run_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0008.png", "assets/images/sprites/FX/fx_run_0008.png");
		type.set ("assets/images/sprites/FX/fx_run_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0009.png", "assets/images/sprites/FX/fx_run_0009.png");
		type.set ("assets/images/sprites/FX/fx_run_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0010.png", "assets/images/sprites/FX/fx_run_0010.png");
		type.set ("assets/images/sprites/FX/fx_run_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0011.png", "assets/images/sprites/FX/fx_run_0011.png");
		type.set ("assets/images/sprites/FX/fx_run_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0012.png", "assets/images/sprites/FX/fx_run_0012.png");
		type.set ("assets/images/sprites/FX/fx_run_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0013.png", "assets/images/sprites/FX/fx_run_0013.png");
		type.set ("assets/images/sprites/FX/fx_run_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/fx_run_0014.png", "assets/images/sprites/FX/fx_run_0014.png");
		type.set ("assets/images/sprites/FX/fx_run_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0001.png", "assets/images/sprites/FX/swordHit0001.png");
		type.set ("assets/images/sprites/FX/swordHit0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0002.png", "assets/images/sprites/FX/swordHit0002.png");
		type.set ("assets/images/sprites/FX/swordHit0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0003.png", "assets/images/sprites/FX/swordHit0003.png");
		type.set ("assets/images/sprites/FX/swordHit0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0004.png", "assets/images/sprites/FX/swordHit0004.png");
		type.set ("assets/images/sprites/FX/swordHit0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0005.png", "assets/images/sprites/FX/swordHit0005.png");
		type.set ("assets/images/sprites/FX/swordHit0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0006.png", "assets/images/sprites/FX/swordHit0006.png");
		type.set ("assets/images/sprites/FX/swordHit0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0007.png", "assets/images/sprites/FX/swordHit0007.png");
		type.set ("assets/images/sprites/FX/swordHit0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0008.png", "assets/images/sprites/FX/swordHit0008.png");
		type.set ("assets/images/sprites/FX/swordHit0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0009.png", "assets/images/sprites/FX/swordHit0009.png");
		type.set ("assets/images/sprites/FX/swordHit0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0010.png", "assets/images/sprites/FX/swordHit0010.png");
		type.set ("assets/images/sprites/FX/swordHit0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/swordHit0011.png", "assets/images/sprites/FX/swordHit0011.png");
		type.set ("assets/images/sprites/FX/swordHit0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0001.png", "assets/images/sprites/FX/wallLoop_0001.png");
		type.set ("assets/images/sprites/FX/wallLoop_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0002.png", "assets/images/sprites/FX/wallLoop_0002.png");
		type.set ("assets/images/sprites/FX/wallLoop_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0003.png", "assets/images/sprites/FX/wallLoop_0003.png");
		type.set ("assets/images/sprites/FX/wallLoop_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0004.png", "assets/images/sprites/FX/wallLoop_0004.png");
		type.set ("assets/images/sprites/FX/wallLoop_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0005.png", "assets/images/sprites/FX/wallLoop_0005.png");
		type.set ("assets/images/sprites/FX/wallLoop_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0006.png", "assets/images/sprites/FX/wallLoop_0006.png");
		type.set ("assets/images/sprites/FX/wallLoop_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0007.png", "assets/images/sprites/FX/wallLoop_0007.png");
		type.set ("assets/images/sprites/FX/wallLoop_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0008.png", "assets/images/sprites/FX/wallLoop_0008.png");
		type.set ("assets/images/sprites/FX/wallLoop_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0009.png", "assets/images/sprites/FX/wallLoop_0009.png");
		type.set ("assets/images/sprites/FX/wallLoop_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0010.png", "assets/images/sprites/FX/wallLoop_0010.png");
		type.set ("assets/images/sprites/FX/wallLoop_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0011.png", "assets/images/sprites/FX/wallLoop_0011.png");
		type.set ("assets/images/sprites/FX/wallLoop_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0012.png", "assets/images/sprites/FX/wallLoop_0012.png");
		type.set ("assets/images/sprites/FX/wallLoop_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0013.png", "assets/images/sprites/FX/wallLoop_0013.png");
		type.set ("assets/images/sprites/FX/wallLoop_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0014.png", "assets/images/sprites/FX/wallLoop_0014.png");
		type.set ("assets/images/sprites/FX/wallLoop_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0015.png", "assets/images/sprites/FX/wallLoop_0015.png");
		type.set ("assets/images/sprites/FX/wallLoop_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0016.png", "assets/images/sprites/FX/wallLoop_0016.png");
		type.set ("assets/images/sprites/FX/wallLoop_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0017.png", "assets/images/sprites/FX/wallLoop_0017.png");
		type.set ("assets/images/sprites/FX/wallLoop_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0018.png", "assets/images/sprites/FX/wallLoop_0018.png");
		type.set ("assets/images/sprites/FX/wallLoop_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0019.png", "assets/images/sprites/FX/wallLoop_0019.png");
		type.set ("assets/images/sprites/FX/wallLoop_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/FX/wallLoop_0020.png", "assets/images/sprites/FX/wallLoop_0020.png");
		type.set ("assets/images/sprites/FX/wallLoop_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png", "assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png");
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png", "assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png");
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png", "assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png");
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png", "assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png");
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png", "assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png");
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0001.png", "assets/images/sprites/punk/punk_attack_floorDown_0001.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0002.png", "assets/images/sprites/punk/punk_attack_floorDown_0002.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0003.png", "assets/images/sprites/punk/punk_attack_floorDown_0003.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0004.png", "assets/images/sprites/punk/punk_attack_floorDown_0004.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0005.png", "assets/images/sprites/punk/punk_attack_floorDown_0005.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0006.png", "assets/images/sprites/punk/punk_attack_floorDown_0006.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0007.png", "assets/images/sprites/punk/punk_attack_floorDown_0007.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0008.png", "assets/images/sprites/punk/punk_attack_floorDown_0008.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0009.png", "assets/images/sprites/punk/punk_attack_floorDown_0009.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0010.png", "assets/images/sprites/punk/punk_attack_floorDown_0010.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0011.png", "assets/images/sprites/punk/punk_attack_floorDown_0011.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0012.png", "assets/images/sprites/punk/punk_attack_floorDown_0012.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0013.png", "assets/images/sprites/punk/punk_attack_floorDown_0013.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0014.png", "assets/images/sprites/punk/punk_attack_floorDown_0014.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0015.png", "assets/images/sprites/punk/punk_attack_floorDown_0015.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0016.png", "assets/images/sprites/punk/punk_attack_floorDown_0016.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0017.png", "assets/images/sprites/punk/punk_attack_floorDown_0017.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0018.png", "assets/images/sprites/punk/punk_attack_floorDown_0018.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorDown_0019.png", "assets/images/sprites/punk/punk_attack_floorDown_0019.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0002.png", "assets/images/sprites/punk/punk_attack_floorSide_0002.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0003.png", "assets/images/sprites/punk/punk_attack_floorSide_0003.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0004.png", "assets/images/sprites/punk/punk_attack_floorSide_0004.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0005.png", "assets/images/sprites/punk/punk_attack_floorSide_0005.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0006.png", "assets/images/sprites/punk/punk_attack_floorSide_0006.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0007.png", "assets/images/sprites/punk/punk_attack_floorSide_0007.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0008.png", "assets/images/sprites/punk/punk_attack_floorSide_0008.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0009.png", "assets/images/sprites/punk/punk_attack_floorSide_0009.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0010.png", "assets/images/sprites/punk/punk_attack_floorSide_0010.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0011.png", "assets/images/sprites/punk/punk_attack_floorSide_0011.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0012.png", "assets/images/sprites/punk/punk_attack_floorSide_0012.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0013.png", "assets/images/sprites/punk/punk_attack_floorSide_0013.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorSide_0014.png", "assets/images/sprites/punk/punk_attack_floorSide_0014.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0001.png", "assets/images/sprites/punk/punk_attack_floorUp_0001.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0002.png", "assets/images/sprites/punk/punk_attack_floorUp_0002.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0003.png", "assets/images/sprites/punk/punk_attack_floorUp_0003.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0004.png", "assets/images/sprites/punk/punk_attack_floorUp_0004.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0005.png", "assets/images/sprites/punk/punk_attack_floorUp_0005.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0006.png", "assets/images/sprites/punk/punk_attack_floorUp_0006.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0007.png", "assets/images/sprites/punk/punk_attack_floorUp_0007.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0008.png", "assets/images/sprites/punk/punk_attack_floorUp_0008.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0009.png", "assets/images/sprites/punk/punk_attack_floorUp_0009.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0010.png", "assets/images/sprites/punk/punk_attack_floorUp_0010.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0011.png", "assets/images/sprites/punk/punk_attack_floorUp_0011.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0012.png", "assets/images/sprites/punk/punk_attack_floorUp_0012.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0013.png", "assets/images/sprites/punk/punk_attack_floorUp_0013.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0014.png", "assets/images/sprites/punk/punk_attack_floorUp_0014.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_attack_floorUp_0015.png", "assets/images/sprites/punk/punk_attack_floorUp_0015.png");
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_dash_.png", "assets/images/sprites/punk/punk_dash_.png");
		type.set ("assets/images/sprites/punk/punk_dash_.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0001.png", "assets/images/sprites/punk/punk_death_0001.png");
		type.set ("assets/images/sprites/punk/punk_death_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0002.png", "assets/images/sprites/punk/punk_death_0002.png");
		type.set ("assets/images/sprites/punk/punk_death_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0003.png", "assets/images/sprites/punk/punk_death_0003.png");
		type.set ("assets/images/sprites/punk/punk_death_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0004.png", "assets/images/sprites/punk/punk_death_0004.png");
		type.set ("assets/images/sprites/punk/punk_death_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0005.png", "assets/images/sprites/punk/punk_death_0005.png");
		type.set ("assets/images/sprites/punk/punk_death_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0006.png", "assets/images/sprites/punk/punk_death_0006.png");
		type.set ("assets/images/sprites/punk/punk_death_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0007.png", "assets/images/sprites/punk/punk_death_0007.png");
		type.set ("assets/images/sprites/punk/punk_death_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0008.png", "assets/images/sprites/punk/punk_death_0008.png");
		type.set ("assets/images/sprites/punk/punk_death_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0009.png", "assets/images/sprites/punk/punk_death_0009.png");
		type.set ("assets/images/sprites/punk/punk_death_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0010.png", "assets/images/sprites/punk/punk_death_0010.png");
		type.set ("assets/images/sprites/punk/punk_death_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0011.png", "assets/images/sprites/punk/punk_death_0011.png");
		type.set ("assets/images/sprites/punk/punk_death_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0012.png", "assets/images/sprites/punk/punk_death_0012.png");
		type.set ("assets/images/sprites/punk/punk_death_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0013.png", "assets/images/sprites/punk/punk_death_0013.png");
		type.set ("assets/images/sprites/punk/punk_death_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0014.png", "assets/images/sprites/punk/punk_death_0014.png");
		type.set ("assets/images/sprites/punk/punk_death_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0015.png", "assets/images/sprites/punk/punk_death_0015.png");
		type.set ("assets/images/sprites/punk/punk_death_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0016.png", "assets/images/sprites/punk/punk_death_0016.png");
		type.set ("assets/images/sprites/punk/punk_death_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0017.png", "assets/images/sprites/punk/punk_death_0017.png");
		type.set ("assets/images/sprites/punk/punk_death_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0018.png", "assets/images/sprites/punk/punk_death_0018.png");
		type.set ("assets/images/sprites/punk/punk_death_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0019.png", "assets/images/sprites/punk/punk_death_0019.png");
		type.set ("assets/images/sprites/punk/punk_death_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0020.png", "assets/images/sprites/punk/punk_death_0020.png");
		type.set ("assets/images/sprites/punk/punk_death_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0021.png", "assets/images/sprites/punk/punk_death_0021.png");
		type.set ("assets/images/sprites/punk/punk_death_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0022.png", "assets/images/sprites/punk/punk_death_0022.png");
		type.set ("assets/images/sprites/punk/punk_death_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0023.png", "assets/images/sprites/punk/punk_death_0023.png");
		type.set ("assets/images/sprites/punk/punk_death_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0024.png", "assets/images/sprites/punk/punk_death_0024.png");
		type.set ("assets/images/sprites/punk/punk_death_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0025.png", "assets/images/sprites/punk/punk_death_0025.png");
		type.set ("assets/images/sprites/punk/punk_death_0025.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0026.png", "assets/images/sprites/punk/punk_death_0026.png");
		type.set ("assets/images/sprites/punk/punk_death_0026.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0027.png", "assets/images/sprites/punk/punk_death_0027.png");
		type.set ("assets/images/sprites/punk/punk_death_0027.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0028.png", "assets/images/sprites/punk/punk_death_0028.png");
		type.set ("assets/images/sprites/punk/punk_death_0028.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0029.png", "assets/images/sprites/punk/punk_death_0029.png");
		type.set ("assets/images/sprites/punk/punk_death_0029.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0030.png", "assets/images/sprites/punk/punk_death_0030.png");
		type.set ("assets/images/sprites/punk/punk_death_0030.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0031.png", "assets/images/sprites/punk/punk_death_0031.png");
		type.set ("assets/images/sprites/punk/punk_death_0031.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0032.png", "assets/images/sprites/punk/punk_death_0032.png");
		type.set ("assets/images/sprites/punk/punk_death_0032.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0033.png", "assets/images/sprites/punk/punk_death_0033.png");
		type.set ("assets/images/sprites/punk/punk_death_0033.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0034.png", "assets/images/sprites/punk/punk_death_0034.png");
		type.set ("assets/images/sprites/punk/punk_death_0034.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0035.png", "assets/images/sprites/punk/punk_death_0035.png");
		type.set ("assets/images/sprites/punk/punk_death_0035.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0036.png", "assets/images/sprites/punk/punk_death_0036.png");
		type.set ("assets/images/sprites/punk/punk_death_0036.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0037.png", "assets/images/sprites/punk/punk_death_0037.png");
		type.set ("assets/images/sprites/punk/punk_death_0037.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0038.png", "assets/images/sprites/punk/punk_death_0038.png");
		type.set ("assets/images/sprites/punk/punk_death_0038.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0039.png", "assets/images/sprites/punk/punk_death_0039.png");
		type.set ("assets/images/sprites/punk/punk_death_0039.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0040.png", "assets/images/sprites/punk/punk_death_0040.png");
		type.set ("assets/images/sprites/punk/punk_death_0040.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0041.png", "assets/images/sprites/punk/punk_death_0041.png");
		type.set ("assets/images/sprites/punk/punk_death_0041.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0042.png", "assets/images/sprites/punk/punk_death_0042.png");
		type.set ("assets/images/sprites/punk/punk_death_0042.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0043.png", "assets/images/sprites/punk/punk_death_0043.png");
		type.set ("assets/images/sprites/punk/punk_death_0043.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0044.png", "assets/images/sprites/punk/punk_death_0044.png");
		type.set ("assets/images/sprites/punk/punk_death_0044.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0045.png", "assets/images/sprites/punk/punk_death_0045.png");
		type.set ("assets/images/sprites/punk/punk_death_0045.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_death_0046.png", "assets/images/sprites/punk/punk_death_0046.png");
		type.set ("assets/images/sprites/punk/punk_death_0046.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0001.png", "assets/images/sprites/punk/punk_idle_0001.png");
		type.set ("assets/images/sprites/punk/punk_idle_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0002.png", "assets/images/sprites/punk/punk_idle_0002.png");
		type.set ("assets/images/sprites/punk/punk_idle_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0003.png", "assets/images/sprites/punk/punk_idle_0003.png");
		type.set ("assets/images/sprites/punk/punk_idle_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0004.png", "assets/images/sprites/punk/punk_idle_0004.png");
		type.set ("assets/images/sprites/punk/punk_idle_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0005.png", "assets/images/sprites/punk/punk_idle_0005.png");
		type.set ("assets/images/sprites/punk/punk_idle_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0006.png", "assets/images/sprites/punk/punk_idle_0006.png");
		type.set ("assets/images/sprites/punk/punk_idle_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0007.png", "assets/images/sprites/punk/punk_idle_0007.png");
		type.set ("assets/images/sprites/punk/punk_idle_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0008.png", "assets/images/sprites/punk/punk_idle_0008.png");
		type.set ("assets/images/sprites/punk/punk_idle_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0009.png", "assets/images/sprites/punk/punk_idle_0009.png");
		type.set ("assets/images/sprites/punk/punk_idle_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0010.png", "assets/images/sprites/punk/punk_idle_0010.png");
		type.set ("assets/images/sprites/punk/punk_idle_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0011.png", "assets/images/sprites/punk/punk_idle_0011.png");
		type.set ("assets/images/sprites/punk/punk_idle_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0012.png", "assets/images/sprites/punk/punk_idle_0012.png");
		type.set ("assets/images/sprites/punk/punk_idle_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0013.png", "assets/images/sprites/punk/punk_idle_0013.png");
		type.set ("assets/images/sprites/punk/punk_idle_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0014.png", "assets/images/sprites/punk/punk_idle_0014.png");
		type.set ("assets/images/sprites/punk/punk_idle_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0015.png", "assets/images/sprites/punk/punk_idle_0015.png");
		type.set ("assets/images/sprites/punk/punk_idle_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0016.png", "assets/images/sprites/punk/punk_idle_0016.png");
		type.set ("assets/images/sprites/punk/punk_idle_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0017.png", "assets/images/sprites/punk/punk_idle_0017.png");
		type.set ("assets/images/sprites/punk/punk_idle_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0018.png", "assets/images/sprites/punk/punk_idle_0018.png");
		type.set ("assets/images/sprites/punk/punk_idle_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0019.png", "assets/images/sprites/punk/punk_idle_0019.png");
		type.set ("assets/images/sprites/punk/punk_idle_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0020.png", "assets/images/sprites/punk/punk_idle_0020.png");
		type.set ("assets/images/sprites/punk/punk_idle_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0021.png", "assets/images/sprites/punk/punk_idle_0021.png");
		type.set ("assets/images/sprites/punk/punk_idle_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0022.png", "assets/images/sprites/punk/punk_idle_0022.png");
		type.set ("assets/images/sprites/punk/punk_idle_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0023.png", "assets/images/sprites/punk/punk_idle_0023.png");
		type.set ("assets/images/sprites/punk/punk_idle_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0024.png", "assets/images/sprites/punk/punk_idle_0024.png");
		type.set ("assets/images/sprites/punk/punk_idle_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_idle_0025.png", "assets/images/sprites/punk/punk_idle_0025.png");
		type.set ("assets/images/sprites/punk/punk_idle_0025.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0001.png", "assets/images/sprites/punk/punk_jumpDown_0001.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0002.png", "assets/images/sprites/punk/punk_jumpDown_0002.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0003.png", "assets/images/sprites/punk/punk_jumpDown_0003.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0004.png", "assets/images/sprites/punk/punk_jumpDown_0004.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0005.png", "assets/images/sprites/punk/punk_jumpDown_0005.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_jumpDown_0006.png", "assets/images/sprites/punk/punk_jumpDown_0006.png");
		type.set ("assets/images/sprites/punk/punk_jumpDown_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/punk_walljump_0001.png", "assets/images/sprites/punk/punk_walljump_0001.png");
		type.set ("assets/images/sprites/punk/punk_walljump_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0001.png", "assets/images/sprites/punk/runPunk_0001.png");
		type.set ("assets/images/sprites/punk/runPunk_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0002.png", "assets/images/sprites/punk/runPunk_0002.png");
		type.set ("assets/images/sprites/punk/runPunk_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0003.png", "assets/images/sprites/punk/runPunk_0003.png");
		type.set ("assets/images/sprites/punk/runPunk_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0004.png", "assets/images/sprites/punk/runPunk_0004.png");
		type.set ("assets/images/sprites/punk/runPunk_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0005.png", "assets/images/sprites/punk/runPunk_0005.png");
		type.set ("assets/images/sprites/punk/runPunk_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0006.png", "assets/images/sprites/punk/runPunk_0006.png");
		type.set ("assets/images/sprites/punk/runPunk_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0007.png", "assets/images/sprites/punk/runPunk_0007.png");
		type.set ("assets/images/sprites/punk/runPunk_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0008.png", "assets/images/sprites/punk/runPunk_0008.png");
		type.set ("assets/images/sprites/punk/runPunk_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0009.png", "assets/images/sprites/punk/runPunk_0009.png");
		type.set ("assets/images/sprites/punk/runPunk_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0010.png", "assets/images/sprites/punk/runPunk_0010.png");
		type.set ("assets/images/sprites/punk/runPunk_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0011.png", "assets/images/sprites/punk/runPunk_0011.png");
		type.set ("assets/images/sprites/punk/runPunk_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0012.png", "assets/images/sprites/punk/runPunk_0012.png");
		type.set ("assets/images/sprites/punk/runPunk_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0013.png", "assets/images/sprites/punk/runPunk_0013.png");
		type.set ("assets/images/sprites/punk/runPunk_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0014.png", "assets/images/sprites/punk/runPunk_0014.png");
		type.set ("assets/images/sprites/punk/runPunk_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0015.png", "assets/images/sprites/punk/runPunk_0015.png");
		type.set ("assets/images/sprites/punk/runPunk_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0016.png", "assets/images/sprites/punk/runPunk_0016.png");
		type.set ("assets/images/sprites/punk/runPunk_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0017.png", "assets/images/sprites/punk/runPunk_0017.png");
		type.set ("assets/images/sprites/punk/runPunk_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0018.png", "assets/images/sprites/punk/runPunk_0018.png");
		type.set ("assets/images/sprites/punk/runPunk_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0019.png", "assets/images/sprites/punk/runPunk_0019.png");
		type.set ("assets/images/sprites/punk/runPunk_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0020.png", "assets/images/sprites/punk/runPunk_0020.png");
		type.set ("assets/images/sprites/punk/runPunk_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0021.png", "assets/images/sprites/punk/runPunk_0021.png");
		type.set ("assets/images/sprites/punk/runPunk_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0022.png", "assets/images/sprites/punk/runPunk_0022.png");
		type.set ("assets/images/sprites/punk/runPunk_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0023.png", "assets/images/sprites/punk/runPunk_0023.png");
		type.set ("assets/images/sprites/punk/runPunk_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/punk/runPunk_0024.png", "assets/images/sprites/punk/runPunk_0024.png");
		type.set ("assets/images/sprites/punk/runPunk_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0001.png", "assets/images/sprites/pUps/bombo_big_load_0001.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0002.png", "assets/images/sprites/pUps/bombo_big_load_0002.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0003.png", "assets/images/sprites/pUps/bombo_big_load_0003.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0004.png", "assets/images/sprites/pUps/bombo_big_load_0004.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0005.png", "assets/images/sprites/pUps/bombo_big_load_0005.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0006.png", "assets/images/sprites/pUps/bombo_big_load_0006.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0007.png", "assets/images/sprites/pUps/bombo_big_load_0007.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bombo_big_load_0008.png", "assets/images/sprites/pUps/bombo_big_load_0008.png");
		type.set ("assets/images/sprites/pUps/bombo_big_load_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bomb_big_white_0001.png", "assets/images/sprites/pUps/bomb_big_white_0001.png");
		type.set ("assets/images/sprites/pUps/bomb_big_white_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/bomb_big_white_0002.png", "assets/images/sprites/pUps/bomb_big_white_0002.png");
		type.set ("assets/images/sprites/pUps/bomb_big_white_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/Crate.png", "assets/images/sprites/pUps/Crate.png");
		type.set ("assets/images/sprites/pUps/Crate.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0001.png", "assets/images/sprites/pUps/explosion_0001.png");
		type.set ("assets/images/sprites/pUps/explosion_0001.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0002.png", "assets/images/sprites/pUps/explosion_0002.png");
		type.set ("assets/images/sprites/pUps/explosion_0002.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0003.png", "assets/images/sprites/pUps/explosion_0003.png");
		type.set ("assets/images/sprites/pUps/explosion_0003.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0004.png", "assets/images/sprites/pUps/explosion_0004.png");
		type.set ("assets/images/sprites/pUps/explosion_0004.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0005.png", "assets/images/sprites/pUps/explosion_0005.png");
		type.set ("assets/images/sprites/pUps/explosion_0005.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0006.png", "assets/images/sprites/pUps/explosion_0006.png");
		type.set ("assets/images/sprites/pUps/explosion_0006.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0007.png", "assets/images/sprites/pUps/explosion_0007.png");
		type.set ("assets/images/sprites/pUps/explosion_0007.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0008.png", "assets/images/sprites/pUps/explosion_0008.png");
		type.set ("assets/images/sprites/pUps/explosion_0008.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0009.png", "assets/images/sprites/pUps/explosion_0009.png");
		type.set ("assets/images/sprites/pUps/explosion_0009.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0010.png", "assets/images/sprites/pUps/explosion_0010.png");
		type.set ("assets/images/sprites/pUps/explosion_0010.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0011.png", "assets/images/sprites/pUps/explosion_0011.png");
		type.set ("assets/images/sprites/pUps/explosion_0011.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0012.png", "assets/images/sprites/pUps/explosion_0012.png");
		type.set ("assets/images/sprites/pUps/explosion_0012.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0013.png", "assets/images/sprites/pUps/explosion_0013.png");
		type.set ("assets/images/sprites/pUps/explosion_0013.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0014.png", "assets/images/sprites/pUps/explosion_0014.png");
		type.set ("assets/images/sprites/pUps/explosion_0014.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0015.png", "assets/images/sprites/pUps/explosion_0015.png");
		type.set ("assets/images/sprites/pUps/explosion_0015.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0016.png", "assets/images/sprites/pUps/explosion_0016.png");
		type.set ("assets/images/sprites/pUps/explosion_0016.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0017.png", "assets/images/sprites/pUps/explosion_0017.png");
		type.set ("assets/images/sprites/pUps/explosion_0017.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0018.png", "assets/images/sprites/pUps/explosion_0018.png");
		type.set ("assets/images/sprites/pUps/explosion_0018.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0019.png", "assets/images/sprites/pUps/explosion_0019.png");
		type.set ("assets/images/sprites/pUps/explosion_0019.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0020.png", "assets/images/sprites/pUps/explosion_0020.png");
		type.set ("assets/images/sprites/pUps/explosion_0020.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0021.png", "assets/images/sprites/pUps/explosion_0021.png");
		type.set ("assets/images/sprites/pUps/explosion_0021.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0022.png", "assets/images/sprites/pUps/explosion_0022.png");
		type.set ("assets/images/sprites/pUps/explosion_0022.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0023.png", "assets/images/sprites/pUps/explosion_0023.png");
		type.set ("assets/images/sprites/pUps/explosion_0023.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0024.png", "assets/images/sprites/pUps/explosion_0024.png");
		type.set ("assets/images/sprites/pUps/explosion_0024.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0025.png", "assets/images/sprites/pUps/explosion_0025.png");
		type.set ("assets/images/sprites/pUps/explosion_0025.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0026.png", "assets/images/sprites/pUps/explosion_0026.png");
		type.set ("assets/images/sprites/pUps/explosion_0026.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0027.png", "assets/images/sprites/pUps/explosion_0027.png");
		type.set ("assets/images/sprites/pUps/explosion_0027.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0028.png", "assets/images/sprites/pUps/explosion_0028.png");
		type.set ("assets/images/sprites/pUps/explosion_0028.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0029.png", "assets/images/sprites/pUps/explosion_0029.png");
		type.set ("assets/images/sprites/pUps/explosion_0029.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0030.png", "assets/images/sprites/pUps/explosion_0030.png");
		type.set ("assets/images/sprites/pUps/explosion_0030.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0031.png", "assets/images/sprites/pUps/explosion_0031.png");
		type.set ("assets/images/sprites/pUps/explosion_0031.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0032.png", "assets/images/sprites/pUps/explosion_0032.png");
		type.set ("assets/images/sprites/pUps/explosion_0032.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0033.png", "assets/images/sprites/pUps/explosion_0033.png");
		type.set ("assets/images/sprites/pUps/explosion_0033.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0034.png", "assets/images/sprites/pUps/explosion_0034.png");
		type.set ("assets/images/sprites/pUps/explosion_0034.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0035.png", "assets/images/sprites/pUps/explosion_0035.png");
		type.set ("assets/images/sprites/pUps/explosion_0035.png", AssetType.IMAGE);
		path.set ("assets/images/sprites/pUps/explosion_0036.png", "assets/images/sprites/pUps/explosion_0036.png");
		type.set ("assets/images/sprites/pUps/explosion_0036.png", AssetType.IMAGE);
		path.set ("assets/images/spritesheetTp.png", "assets/images/spritesheetTp.png");
		type.set ("assets/images/spritesheetTp.png", AssetType.IMAGE);
		path.set ("assets/images/tile01.png", "assets/images/tile01.png");
		type.set ("assets/images/tile01.png", AssetType.IMAGE);
		path.set ("assets/images/towerfall_test2_002.png", "assets/images/towerfall_test2_002.png");
		type.set ("assets/images/towerfall_test2_002.png", AssetType.IMAGE);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/clash.mp3", "assets/sounds/clash.mp3");
		type.set ("assets/sounds/clash.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/clash.ogg", "assets/sounds/clash.ogg");
		type.set ("assets/sounds/clash.ogg", AssetType.SOUND);
		path.set ("assets/sounds/explode.ogg", "assets/sounds/explode.ogg");
		type.set ("assets/sounds/explode.ogg", AssetType.SOUND);
		path.set ("assets/sounds/explodemini.wav", "assets/sounds/explodemini.wav");
		type.set ("assets/sounds/explodemini.wav", AssetType.SOUND);
		path.set ("assets/sounds/hurt.mp3", "assets/sounds/hurt.mp3");
		type.set ("assets/sounds/hurt.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/hurt.ogg", "assets/sounds/hurt.ogg");
		type.set ("assets/sounds/hurt.ogg", AssetType.SOUND);
		path.set ("assets/sounds/slash.mp3", "assets/sounds/slash.mp3");
		type.set ("assets/sounds/slash.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/slash.ogg", "assets/sounds/slash.ogg");
		type.set ("assets/sounds/slash.ogg", AssetType.SOUND);
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		path.set ("clash", "assets/sounds/clash.ogg");
		type.set ("clash", AssetType.SOUND);
		path.set ("slash", "assets/sounds/slash.ogg");
		type.set ("slash", AssetType.SOUND);
		path.set ("hurt", "assets/sounds/hurt.ogg");
		type.set ("hurt", AssetType.SOUND);
		path.set ("explode", "assets/sounds/explode.ogg");
		type.set ("explode", AssetType.SOUND);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/big version.dam";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/big version.dam.bak";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/mapCSV_Group1_Map1.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/megaversion.dam";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/megaversion.dam.bak";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/megaversion3.dam";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/spritesData.json";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/texture.tps";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/textureNew.tps";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/textureWithFolders.tps";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/charLight.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cityCartoon_01.swf";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/conceptLab.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/ligth.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/marco.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/piedritas.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sceneLightBlue.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0025.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0026.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0027.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0028.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0029.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0030.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0031.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0032.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0033.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0034.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0035.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0036.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0037.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0038.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0039.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0040.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0041.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0042.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0043.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0044.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0045.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/AirDeathExport0046.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/Chief_CoverNoBallExport0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/IdleExport0025.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpDownExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpFallExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/JumpUpExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/run2Export0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorDown0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorSideCutExport0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/sword_floorUpExport0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/chief/wallJumpOutExport0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/dashCloudEXPORT0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashFloor1EXPORT0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashGunTrailEXPORT.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/DashTrailExport.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorFall_2_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump1_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/floorJump2_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/fx_run_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/swordHit0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/FX/wallLoop_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorDown_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorSide_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_attack_floorUp_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_dash_.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0025.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0026.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0027.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0028.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0029.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0030.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0031.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0032.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0033.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0034.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0035.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0036.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0037.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0038.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0039.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0040.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0041.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0042.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0043.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0044.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0045.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_death_0046.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_idle_0025.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_jumpDown_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/punk_walljump_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/punk/runPunk_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bombo_big_load_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bomb_big_white_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/bomb_big_white_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/Crate.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0001.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0003.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0004.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0005.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0006.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0007.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0008.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0009.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0010.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0011.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0012.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0013.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0014.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0015.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0016.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0017.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0018.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0019.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0020.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0021.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0022.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0023.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0024.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0025.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0026.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0027.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0028.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0029.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0030.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0031.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0032.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0033.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0034.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0035.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/explosion_0036.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/spritesheetTp.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tile01.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/towerfall_test2_002.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/clash.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/clash.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/explode.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/explodemini.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/hurt.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/hurt.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/slash.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/slash.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "clash";
		path.set (id, "assets/sounds/clash.ogg");
		type.set (id, AssetType.SOUND);
		id = "slash";
		path.set (id, "assets/sounds/slash.ogg");
		type.set (id, AssetType.SOUND);
		id = "hurt";
		path.set (id, "assets/sounds/hurt.ogg");
		type.set (id, AssetType.SOUND);
		id = "explode";
		path.set (id, "assets/sounds/explode.ogg");
		type.set (id, AssetType.SOUND);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash



































































































































































































































































































































































































































































































































































































#elseif html5



































































































































































































































































































































































































































































































































































































#else



#if (windows || mac || linux)





#end

#if openfl

#end

#end
#end


#end