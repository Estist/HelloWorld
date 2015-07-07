package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.system.BackgroundWorker;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
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
		
		className.set ("assets/data/big version.dam", __ASSET__assets_data_big_version_dam);
		type.set ("assets/data/big version.dam", AssetType.TEXT);
		className.set ("assets/data/big version.dam.bak", __ASSET__assets_data_big_version_dam_bak);
		type.set ("assets/data/big version.dam.bak", AssetType.TEXT);
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/mapCSV_Group1_Map1.csv", __ASSET__assets_data_mapcsv_group1_map1_csv);
		type.set ("assets/data/mapCSV_Group1_Map1.csv", AssetType.TEXT);
		className.set ("assets/data/megaversion.dam", __ASSET__assets_data_megaversion_dam);
		type.set ("assets/data/megaversion.dam", AssetType.TEXT);
		className.set ("assets/data/megaversion.dam.bak", __ASSET__assets_data_megaversion_dam_bak);
		type.set ("assets/data/megaversion.dam.bak", AssetType.TEXT);
		className.set ("assets/data/megaversion3.dam", __ASSET__assets_data_megaversion3_dam);
		type.set ("assets/data/megaversion3.dam", AssetType.TEXT);
		className.set ("assets/data/spritesData.json", __ASSET__assets_data_spritesdata_json);
		type.set ("assets/data/spritesData.json", AssetType.TEXT);
		className.set ("assets/data/texture.tps", __ASSET__assets_data_texture_tps);
		type.set ("assets/data/texture.tps", AssetType.TEXT);
		className.set ("assets/data/textureNew.tps", __ASSET__assets_data_texturenew_tps);
		type.set ("assets/data/textureNew.tps", AssetType.TEXT);
		className.set ("assets/data/textureWithFolders.tps", __ASSET__assets_data_texturewithfolders_tps);
		type.set ("assets/data/textureWithFolders.tps", AssetType.TEXT);
		className.set ("assets/images/1.png", __ASSET__assets_images_1_png);
		type.set ("assets/images/1.png", AssetType.IMAGE);
		className.set ("assets/images/2.png", __ASSET__assets_images_2_png);
		type.set ("assets/images/2.png", AssetType.IMAGE);
		className.set ("assets/images/charLight.png", __ASSET__assets_images_charlight_png);
		type.set ("assets/images/charLight.png", AssetType.IMAGE);
		className.set ("assets/images/cityCartoon_01.swf", __ASSET__assets_images_citycartoon_01_swf);
		type.set ("assets/images/cityCartoon_01.swf", AssetType.TEXT);
		className.set ("assets/images/conceptLab.png", __ASSET__assets_images_conceptlab_png);
		type.set ("assets/images/conceptLab.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/ligth.png", __ASSET__assets_images_ligth_png);
		type.set ("assets/images/ligth.png", AssetType.IMAGE);
		className.set ("assets/images/marco.png", __ASSET__assets_images_marco_png);
		type.set ("assets/images/marco.png", AssetType.IMAGE);
		className.set ("assets/images/piedritas.png", __ASSET__assets_images_piedritas_png);
		type.set ("assets/images/piedritas.png", AssetType.IMAGE);
		className.set ("assets/images/sceneLightBlue.png", __ASSET__assets_images_scenelightblue_png);
		type.set ("assets/images/sceneLightBlue.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png", __ASSET__assets_images_sprites_chief__sword_floorsidecutexport0014removed_png);
		type.set ("assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png", __ASSET__assets_images_sprites_chief__sword_floorsidecutexport0015removed_png);
		type.set ("assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0001.png", __ASSET__assets_images_sprites_chief_airdeathexport0001_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0002.png", __ASSET__assets_images_sprites_chief_airdeathexport0002_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0003.png", __ASSET__assets_images_sprites_chief_airdeathexport0003_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0004.png", __ASSET__assets_images_sprites_chief_airdeathexport0004_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0005.png", __ASSET__assets_images_sprites_chief_airdeathexport0005_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0006.png", __ASSET__assets_images_sprites_chief_airdeathexport0006_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0007.png", __ASSET__assets_images_sprites_chief_airdeathexport0007_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0008.png", __ASSET__assets_images_sprites_chief_airdeathexport0008_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0009.png", __ASSET__assets_images_sprites_chief_airdeathexport0009_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0010.png", __ASSET__assets_images_sprites_chief_airdeathexport0010_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0011.png", __ASSET__assets_images_sprites_chief_airdeathexport0011_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0012.png", __ASSET__assets_images_sprites_chief_airdeathexport0012_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0013.png", __ASSET__assets_images_sprites_chief_airdeathexport0013_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0014.png", __ASSET__assets_images_sprites_chief_airdeathexport0014_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0015.png", __ASSET__assets_images_sprites_chief_airdeathexport0015_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0016.png", __ASSET__assets_images_sprites_chief_airdeathexport0016_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0017.png", __ASSET__assets_images_sprites_chief_airdeathexport0017_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0018.png", __ASSET__assets_images_sprites_chief_airdeathexport0018_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0019.png", __ASSET__assets_images_sprites_chief_airdeathexport0019_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0020.png", __ASSET__assets_images_sprites_chief_airdeathexport0020_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0021.png", __ASSET__assets_images_sprites_chief_airdeathexport0021_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0022.png", __ASSET__assets_images_sprites_chief_airdeathexport0022_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0023.png", __ASSET__assets_images_sprites_chief_airdeathexport0023_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0023.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0024.png", __ASSET__assets_images_sprites_chief_airdeathexport0024_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0024.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0025.png", __ASSET__assets_images_sprites_chief_airdeathexport0025_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0025.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0026.png", __ASSET__assets_images_sprites_chief_airdeathexport0026_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0026.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0027.png", __ASSET__assets_images_sprites_chief_airdeathexport0027_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0027.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0028.png", __ASSET__assets_images_sprites_chief_airdeathexport0028_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0028.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0029.png", __ASSET__assets_images_sprites_chief_airdeathexport0029_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0029.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0030.png", __ASSET__assets_images_sprites_chief_airdeathexport0030_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0030.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0031.png", __ASSET__assets_images_sprites_chief_airdeathexport0031_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0031.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0032.png", __ASSET__assets_images_sprites_chief_airdeathexport0032_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0032.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0033.png", __ASSET__assets_images_sprites_chief_airdeathexport0033_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0033.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0034.png", __ASSET__assets_images_sprites_chief_airdeathexport0034_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0034.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0035.png", __ASSET__assets_images_sprites_chief_airdeathexport0035_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0035.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0036.png", __ASSET__assets_images_sprites_chief_airdeathexport0036_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0036.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0037.png", __ASSET__assets_images_sprites_chief_airdeathexport0037_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0037.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0038.png", __ASSET__assets_images_sprites_chief_airdeathexport0038_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0038.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0039.png", __ASSET__assets_images_sprites_chief_airdeathexport0039_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0039.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0040.png", __ASSET__assets_images_sprites_chief_airdeathexport0040_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0040.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0041.png", __ASSET__assets_images_sprites_chief_airdeathexport0041_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0041.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0042.png", __ASSET__assets_images_sprites_chief_airdeathexport0042_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0042.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0043.png", __ASSET__assets_images_sprites_chief_airdeathexport0043_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0043.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0044.png", __ASSET__assets_images_sprites_chief_airdeathexport0044_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0044.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0045.png", __ASSET__assets_images_sprites_chief_airdeathexport0045_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0045.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/AirDeathExport0046.png", __ASSET__assets_images_sprites_chief_airdeathexport0046_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0046.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0001.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0001_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0002.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0002_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0003.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0003_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0004.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0004_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0005.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0005_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0006.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0006_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0007.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0007_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0008.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0008_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0009.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0009_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0010.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0010_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0011.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0011_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0001.png", __ASSET__assets_images_sprites_chief_idleexport0001_png);
		type.set ("assets/images/sprites/chief/IdleExport0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0002.png", __ASSET__assets_images_sprites_chief_idleexport0002_png);
		type.set ("assets/images/sprites/chief/IdleExport0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0003.png", __ASSET__assets_images_sprites_chief_idleexport0003_png);
		type.set ("assets/images/sprites/chief/IdleExport0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0004.png", __ASSET__assets_images_sprites_chief_idleexport0004_png);
		type.set ("assets/images/sprites/chief/IdleExport0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0005.png", __ASSET__assets_images_sprites_chief_idleexport0005_png);
		type.set ("assets/images/sprites/chief/IdleExport0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0006.png", __ASSET__assets_images_sprites_chief_idleexport0006_png);
		type.set ("assets/images/sprites/chief/IdleExport0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0007.png", __ASSET__assets_images_sprites_chief_idleexport0007_png);
		type.set ("assets/images/sprites/chief/IdleExport0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0008.png", __ASSET__assets_images_sprites_chief_idleexport0008_png);
		type.set ("assets/images/sprites/chief/IdleExport0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0009.png", __ASSET__assets_images_sprites_chief_idleexport0009_png);
		type.set ("assets/images/sprites/chief/IdleExport0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0010.png", __ASSET__assets_images_sprites_chief_idleexport0010_png);
		type.set ("assets/images/sprites/chief/IdleExport0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0011.png", __ASSET__assets_images_sprites_chief_idleexport0011_png);
		type.set ("assets/images/sprites/chief/IdleExport0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0012.png", __ASSET__assets_images_sprites_chief_idleexport0012_png);
		type.set ("assets/images/sprites/chief/IdleExport0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0013.png", __ASSET__assets_images_sprites_chief_idleexport0013_png);
		type.set ("assets/images/sprites/chief/IdleExport0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0014.png", __ASSET__assets_images_sprites_chief_idleexport0014_png);
		type.set ("assets/images/sprites/chief/IdleExport0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0015.png", __ASSET__assets_images_sprites_chief_idleexport0015_png);
		type.set ("assets/images/sprites/chief/IdleExport0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0016.png", __ASSET__assets_images_sprites_chief_idleexport0016_png);
		type.set ("assets/images/sprites/chief/IdleExport0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0017.png", __ASSET__assets_images_sprites_chief_idleexport0017_png);
		type.set ("assets/images/sprites/chief/IdleExport0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0018.png", __ASSET__assets_images_sprites_chief_idleexport0018_png);
		type.set ("assets/images/sprites/chief/IdleExport0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0019.png", __ASSET__assets_images_sprites_chief_idleexport0019_png);
		type.set ("assets/images/sprites/chief/IdleExport0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0020.png", __ASSET__assets_images_sprites_chief_idleexport0020_png);
		type.set ("assets/images/sprites/chief/IdleExport0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0021.png", __ASSET__assets_images_sprites_chief_idleexport0021_png);
		type.set ("assets/images/sprites/chief/IdleExport0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0022.png", __ASSET__assets_images_sprites_chief_idleexport0022_png);
		type.set ("assets/images/sprites/chief/IdleExport0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0023.png", __ASSET__assets_images_sprites_chief_idleexport0023_png);
		type.set ("assets/images/sprites/chief/IdleExport0023.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0024.png", __ASSET__assets_images_sprites_chief_idleexport0024_png);
		type.set ("assets/images/sprites/chief/IdleExport0024.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/IdleExport0025.png", __ASSET__assets_images_sprites_chief_idleexport0025_png);
		type.set ("assets/images/sprites/chief/IdleExport0025.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpDownExport0001.png", __ASSET__assets_images_sprites_chief_jumpdownexport0001_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpDownExport0002.png", __ASSET__assets_images_sprites_chief_jumpdownexport0002_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpDownExport0003.png", __ASSET__assets_images_sprites_chief_jumpdownexport0003_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpDownExport0004.png", __ASSET__assets_images_sprites_chief_jumpdownexport0004_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpDownExport0005.png", __ASSET__assets_images_sprites_chief_jumpdownexport0005_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpDownExport0006.png", __ASSET__assets_images_sprites_chief_jumpdownexport0006_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpFallExport0001.png", __ASSET__assets_images_sprites_chief_jumpfallexport0001_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpFallExport0002.png", __ASSET__assets_images_sprites_chief_jumpfallexport0002_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpFallExport0003.png", __ASSET__assets_images_sprites_chief_jumpfallexport0003_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpFallExport0004.png", __ASSET__assets_images_sprites_chief_jumpfallexport0004_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpFallExport0005.png", __ASSET__assets_images_sprites_chief_jumpfallexport0005_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpFallExport0006.png", __ASSET__assets_images_sprites_chief_jumpfallexport0006_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpUpExport0001.png", __ASSET__assets_images_sprites_chief_jumpupexport0001_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpUpExport0002.png", __ASSET__assets_images_sprites_chief_jumpupexport0002_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpUpExport0003.png", __ASSET__assets_images_sprites_chief_jumpupexport0003_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpUpExport0004.png", __ASSET__assets_images_sprites_chief_jumpupexport0004_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpUpExport0005.png", __ASSET__assets_images_sprites_chief_jumpupexport0005_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpUpExport0006.png", __ASSET__assets_images_sprites_chief_jumpupexport0006_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/JumpUpExport0007.png", __ASSET__assets_images_sprites_chief_jumpupexport0007_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0001.png", __ASSET__assets_images_sprites_chief_run2export0001_png);
		type.set ("assets/images/sprites/chief/run2Export0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0002.png", __ASSET__assets_images_sprites_chief_run2export0002_png);
		type.set ("assets/images/sprites/chief/run2Export0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0003.png", __ASSET__assets_images_sprites_chief_run2export0003_png);
		type.set ("assets/images/sprites/chief/run2Export0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0004.png", __ASSET__assets_images_sprites_chief_run2export0004_png);
		type.set ("assets/images/sprites/chief/run2Export0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0005.png", __ASSET__assets_images_sprites_chief_run2export0005_png);
		type.set ("assets/images/sprites/chief/run2Export0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0006.png", __ASSET__assets_images_sprites_chief_run2export0006_png);
		type.set ("assets/images/sprites/chief/run2Export0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0007.png", __ASSET__assets_images_sprites_chief_run2export0007_png);
		type.set ("assets/images/sprites/chief/run2Export0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0008.png", __ASSET__assets_images_sprites_chief_run2export0008_png);
		type.set ("assets/images/sprites/chief/run2Export0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0009.png", __ASSET__assets_images_sprites_chief_run2export0009_png);
		type.set ("assets/images/sprites/chief/run2Export0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0010.png", __ASSET__assets_images_sprites_chief_run2export0010_png);
		type.set ("assets/images/sprites/chief/run2Export0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0011.png", __ASSET__assets_images_sprites_chief_run2export0011_png);
		type.set ("assets/images/sprites/chief/run2Export0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0012.png", __ASSET__assets_images_sprites_chief_run2export0012_png);
		type.set ("assets/images/sprites/chief/run2Export0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0013.png", __ASSET__assets_images_sprites_chief_run2export0013_png);
		type.set ("assets/images/sprites/chief/run2Export0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0014.png", __ASSET__assets_images_sprites_chief_run2export0014_png);
		type.set ("assets/images/sprites/chief/run2Export0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0015.png", __ASSET__assets_images_sprites_chief_run2export0015_png);
		type.set ("assets/images/sprites/chief/run2Export0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0016.png", __ASSET__assets_images_sprites_chief_run2export0016_png);
		type.set ("assets/images/sprites/chief/run2Export0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0017.png", __ASSET__assets_images_sprites_chief_run2export0017_png);
		type.set ("assets/images/sprites/chief/run2Export0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0018.png", __ASSET__assets_images_sprites_chief_run2export0018_png);
		type.set ("assets/images/sprites/chief/run2Export0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0019.png", __ASSET__assets_images_sprites_chief_run2export0019_png);
		type.set ("assets/images/sprites/chief/run2Export0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0020.png", __ASSET__assets_images_sprites_chief_run2export0020_png);
		type.set ("assets/images/sprites/chief/run2Export0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0021.png", __ASSET__assets_images_sprites_chief_run2export0021_png);
		type.set ("assets/images/sprites/chief/run2Export0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0022.png", __ASSET__assets_images_sprites_chief_run2export0022_png);
		type.set ("assets/images/sprites/chief/run2Export0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/run2Export0023.png", __ASSET__assets_images_sprites_chief_run2export0023_png);
		type.set ("assets/images/sprites/chief/run2Export0023.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0001.png", __ASSET__assets_images_sprites_chief_sword_floordown0001_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0002.png", __ASSET__assets_images_sprites_chief_sword_floordown0002_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0003.png", __ASSET__assets_images_sprites_chief_sword_floordown0003_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0004.png", __ASSET__assets_images_sprites_chief_sword_floordown0004_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0005.png", __ASSET__assets_images_sprites_chief_sword_floordown0005_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0006.png", __ASSET__assets_images_sprites_chief_sword_floordown0006_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0007.png", __ASSET__assets_images_sprites_chief_sword_floordown0007_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0008.png", __ASSET__assets_images_sprites_chief_sword_floordown0008_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0009.png", __ASSET__assets_images_sprites_chief_sword_floordown0009_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0010.png", __ASSET__assets_images_sprites_chief_sword_floordown0010_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0011.png", __ASSET__assets_images_sprites_chief_sword_floordown0011_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0012.png", __ASSET__assets_images_sprites_chief_sword_floordown0012_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0013.png", __ASSET__assets_images_sprites_chief_sword_floordown0013_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0014.png", __ASSET__assets_images_sprites_chief_sword_floordown0014_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0015.png", __ASSET__assets_images_sprites_chief_sword_floordown0015_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0016.png", __ASSET__assets_images_sprites_chief_sword_floordown0016_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0017.png", __ASSET__assets_images_sprites_chief_sword_floordown0017_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0018.png", __ASSET__assets_images_sprites_chief_sword_floordown0018_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorDown0019.png", __ASSET__assets_images_sprites_chief_sword_floordown0019_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0001.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0001_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0002.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0002_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0003.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0003_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0004.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0004_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0005.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0005_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0006.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0006_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0007.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0007_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0008.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0008_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0009.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0009_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0010.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0010_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0011.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0011_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0012.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0012_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0013.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0013_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0001.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0001_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0002.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0002_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0003.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0003_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0004.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0004_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0005.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0005_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0006.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0006_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0007.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0007_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0008.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0008_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0009.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0009_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0010.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0010_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0011.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0011_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0012.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0012_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0013.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0013_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0014.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0014_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/sword_floorUpExport0015.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0015_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/wallJumpOutExport0001.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0001_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/wallJumpOutExport0002.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0002_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/wallJumpOutExport0003.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0003_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/wallJumpOutExport0004.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0004_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/wallJumpOutExport0005.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0005_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/chief/wallJumpOutExport0006.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0006_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0001.png", __ASSET__assets_images_sprites_fx_dashcloudexport0001_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0002.png", __ASSET__assets_images_sprites_fx_dashcloudexport0002_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0003.png", __ASSET__assets_images_sprites_fx_dashcloudexport0003_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0004.png", __ASSET__assets_images_sprites_fx_dashcloudexport0004_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0005.png", __ASSET__assets_images_sprites_fx_dashcloudexport0005_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0006.png", __ASSET__assets_images_sprites_fx_dashcloudexport0006_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0007.png", __ASSET__assets_images_sprites_fx_dashcloudexport0007_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0008.png", __ASSET__assets_images_sprites_fx_dashcloudexport0008_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0009.png", __ASSET__assets_images_sprites_fx_dashcloudexport0009_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0010.png", __ASSET__assets_images_sprites_fx_dashcloudexport0010_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0011.png", __ASSET__assets_images_sprites_fx_dashcloudexport0011_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0001.png", __ASSET__assets_images_sprites_fx_dashfloor1export0001_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0002.png", __ASSET__assets_images_sprites_fx_dashfloor1export0002_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0003.png", __ASSET__assets_images_sprites_fx_dashfloor1export0003_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0004.png", __ASSET__assets_images_sprites_fx_dashfloor1export0004_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0005.png", __ASSET__assets_images_sprites_fx_dashfloor1export0005_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0006.png", __ASSET__assets_images_sprites_fx_dashfloor1export0006_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0007.png", __ASSET__assets_images_sprites_fx_dashfloor1export0007_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0008.png", __ASSET__assets_images_sprites_fx_dashfloor1export0008_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/DashGunTrailEXPORT.png", __ASSET__assets_images_sprites_fx_dashguntrailexport_png);
		type.set ("assets/images/sprites/FX/DashGunTrailEXPORT.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/DashTrailExport.png", __ASSET__assets_images_sprites_fx_dashtrailexport_png);
		type.set ("assets/images/sprites/FX/DashTrailExport.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0001.png", __ASSET__assets_images_sprites_fx_floorfall_0001_png);
		type.set ("assets/images/sprites/FX/floorFall_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0002.png", __ASSET__assets_images_sprites_fx_floorfall_0002_png);
		type.set ("assets/images/sprites/FX/floorFall_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0003.png", __ASSET__assets_images_sprites_fx_floorfall_0003_png);
		type.set ("assets/images/sprites/FX/floorFall_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0004.png", __ASSET__assets_images_sprites_fx_floorfall_0004_png);
		type.set ("assets/images/sprites/FX/floorFall_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0005.png", __ASSET__assets_images_sprites_fx_floorfall_0005_png);
		type.set ("assets/images/sprites/FX/floorFall_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0006.png", __ASSET__assets_images_sprites_fx_floorfall_0006_png);
		type.set ("assets/images/sprites/FX/floorFall_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0007.png", __ASSET__assets_images_sprites_fx_floorfall_0007_png);
		type.set ("assets/images/sprites/FX/floorFall_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0008.png", __ASSET__assets_images_sprites_fx_floorfall_0008_png);
		type.set ("assets/images/sprites/FX/floorFall_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0009.png", __ASSET__assets_images_sprites_fx_floorfall_0009_png);
		type.set ("assets/images/sprites/FX/floorFall_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0010.png", __ASSET__assets_images_sprites_fx_floorfall_0010_png);
		type.set ("assets/images/sprites/FX/floorFall_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0011.png", __ASSET__assets_images_sprites_fx_floorfall_0011_png);
		type.set ("assets/images/sprites/FX/floorFall_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0012.png", __ASSET__assets_images_sprites_fx_floorfall_0012_png);
		type.set ("assets/images/sprites/FX/floorFall_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0013.png", __ASSET__assets_images_sprites_fx_floorfall_0013_png);
		type.set ("assets/images/sprites/FX/floorFall_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0014.png", __ASSET__assets_images_sprites_fx_floorfall_0014_png);
		type.set ("assets/images/sprites/FX/floorFall_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0015.png", __ASSET__assets_images_sprites_fx_floorfall_0015_png);
		type.set ("assets/images/sprites/FX/floorFall_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0016.png", __ASSET__assets_images_sprites_fx_floorfall_0016_png);
		type.set ("assets/images/sprites/FX/floorFall_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0017.png", __ASSET__assets_images_sprites_fx_floorfall_0017_png);
		type.set ("assets/images/sprites/FX/floorFall_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0018.png", __ASSET__assets_images_sprites_fx_floorfall_0018_png);
		type.set ("assets/images/sprites/FX/floorFall_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0019.png", __ASSET__assets_images_sprites_fx_floorfall_0019_png);
		type.set ("assets/images/sprites/FX/floorFall_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0020.png", __ASSET__assets_images_sprites_fx_floorfall_0020_png);
		type.set ("assets/images/sprites/FX/floorFall_0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0021.png", __ASSET__assets_images_sprites_fx_floorfall_0021_png);
		type.set ("assets/images/sprites/FX/floorFall_0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_0022.png", __ASSET__assets_images_sprites_fx_floorfall_0022_png);
		type.set ("assets/images/sprites/FX/floorFall_0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0001.png", __ASSET__assets_images_sprites_fx_floorfall_2_0001_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0002.png", __ASSET__assets_images_sprites_fx_floorfall_2_0002_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0003.png", __ASSET__assets_images_sprites_fx_floorfall_2_0003_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0004.png", __ASSET__assets_images_sprites_fx_floorfall_2_0004_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0005.png", __ASSET__assets_images_sprites_fx_floorfall_2_0005_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0006.png", __ASSET__assets_images_sprites_fx_floorfall_2_0006_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0007.png", __ASSET__assets_images_sprites_fx_floorfall_2_0007_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0008.png", __ASSET__assets_images_sprites_fx_floorfall_2_0008_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0009.png", __ASSET__assets_images_sprites_fx_floorfall_2_0009_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0010.png", __ASSET__assets_images_sprites_fx_floorfall_2_0010_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0011.png", __ASSET__assets_images_sprites_fx_floorfall_2_0011_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0012.png", __ASSET__assets_images_sprites_fx_floorfall_2_0012_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0013.png", __ASSET__assets_images_sprites_fx_floorfall_2_0013_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0014.png", __ASSET__assets_images_sprites_fx_floorfall_2_0014_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0015.png", __ASSET__assets_images_sprites_fx_floorfall_2_0015_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0016.png", __ASSET__assets_images_sprites_fx_floorfall_2_0016_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0017.png", __ASSET__assets_images_sprites_fx_floorfall_2_0017_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0018.png", __ASSET__assets_images_sprites_fx_floorfall_2_0018_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0019.png", __ASSET__assets_images_sprites_fx_floorfall_2_0019_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0020.png", __ASSET__assets_images_sprites_fx_floorfall_2_0020_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0021.png", __ASSET__assets_images_sprites_fx_floorfall_2_0021_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0022.png", __ASSET__assets_images_sprites_fx_floorfall_2_0022_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0023.png", __ASSET__assets_images_sprites_fx_floorfall_2_0023_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0023.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorFall_2_0024.png", __ASSET__assets_images_sprites_fx_floorfall_2_0024_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0024.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0001.png", __ASSET__assets_images_sprites_fx_floorjump1_0001_png);
		type.set ("assets/images/sprites/FX/floorJump1_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0002.png", __ASSET__assets_images_sprites_fx_floorjump1_0002_png);
		type.set ("assets/images/sprites/FX/floorJump1_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0003.png", __ASSET__assets_images_sprites_fx_floorjump1_0003_png);
		type.set ("assets/images/sprites/FX/floorJump1_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0004.png", __ASSET__assets_images_sprites_fx_floorjump1_0004_png);
		type.set ("assets/images/sprites/FX/floorJump1_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0005.png", __ASSET__assets_images_sprites_fx_floorjump1_0005_png);
		type.set ("assets/images/sprites/FX/floorJump1_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0006.png", __ASSET__assets_images_sprites_fx_floorjump1_0006_png);
		type.set ("assets/images/sprites/FX/floorJump1_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0007.png", __ASSET__assets_images_sprites_fx_floorjump1_0007_png);
		type.set ("assets/images/sprites/FX/floorJump1_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0008.png", __ASSET__assets_images_sprites_fx_floorjump1_0008_png);
		type.set ("assets/images/sprites/FX/floorJump1_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0009.png", __ASSET__assets_images_sprites_fx_floorjump1_0009_png);
		type.set ("assets/images/sprites/FX/floorJump1_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0010.png", __ASSET__assets_images_sprites_fx_floorjump1_0010_png);
		type.set ("assets/images/sprites/FX/floorJump1_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0011.png", __ASSET__assets_images_sprites_fx_floorjump1_0011_png);
		type.set ("assets/images/sprites/FX/floorJump1_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0012.png", __ASSET__assets_images_sprites_fx_floorjump1_0012_png);
		type.set ("assets/images/sprites/FX/floorJump1_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0013.png", __ASSET__assets_images_sprites_fx_floorjump1_0013_png);
		type.set ("assets/images/sprites/FX/floorJump1_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0014.png", __ASSET__assets_images_sprites_fx_floorjump1_0014_png);
		type.set ("assets/images/sprites/FX/floorJump1_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0015.png", __ASSET__assets_images_sprites_fx_floorjump1_0015_png);
		type.set ("assets/images/sprites/FX/floorJump1_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0016.png", __ASSET__assets_images_sprites_fx_floorjump1_0016_png);
		type.set ("assets/images/sprites/FX/floorJump1_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0017.png", __ASSET__assets_images_sprites_fx_floorjump1_0017_png);
		type.set ("assets/images/sprites/FX/floorJump1_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0018.png", __ASSET__assets_images_sprites_fx_floorjump1_0018_png);
		type.set ("assets/images/sprites/FX/floorJump1_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0019.png", __ASSET__assets_images_sprites_fx_floorjump1_0019_png);
		type.set ("assets/images/sprites/FX/floorJump1_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0020.png", __ASSET__assets_images_sprites_fx_floorjump1_0020_png);
		type.set ("assets/images/sprites/FX/floorJump1_0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0021.png", __ASSET__assets_images_sprites_fx_floorjump1_0021_png);
		type.set ("assets/images/sprites/FX/floorJump1_0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0022.png", __ASSET__assets_images_sprites_fx_floorjump1_0022_png);
		type.set ("assets/images/sprites/FX/floorJump1_0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0023.png", __ASSET__assets_images_sprites_fx_floorjump1_0023_png);
		type.set ("assets/images/sprites/FX/floorJump1_0023.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump1_0024.png", __ASSET__assets_images_sprites_fx_floorjump1_0024_png);
		type.set ("assets/images/sprites/FX/floorJump1_0024.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0001.png", __ASSET__assets_images_sprites_fx_floorjump2_0001_png);
		type.set ("assets/images/sprites/FX/floorJump2_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0002.png", __ASSET__assets_images_sprites_fx_floorjump2_0002_png);
		type.set ("assets/images/sprites/FX/floorJump2_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0003.png", __ASSET__assets_images_sprites_fx_floorjump2_0003_png);
		type.set ("assets/images/sprites/FX/floorJump2_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0004.png", __ASSET__assets_images_sprites_fx_floorjump2_0004_png);
		type.set ("assets/images/sprites/FX/floorJump2_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0005.png", __ASSET__assets_images_sprites_fx_floorjump2_0005_png);
		type.set ("assets/images/sprites/FX/floorJump2_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0006.png", __ASSET__assets_images_sprites_fx_floorjump2_0006_png);
		type.set ("assets/images/sprites/FX/floorJump2_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0007.png", __ASSET__assets_images_sprites_fx_floorjump2_0007_png);
		type.set ("assets/images/sprites/FX/floorJump2_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0008.png", __ASSET__assets_images_sprites_fx_floorjump2_0008_png);
		type.set ("assets/images/sprites/FX/floorJump2_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0009.png", __ASSET__assets_images_sprites_fx_floorjump2_0009_png);
		type.set ("assets/images/sprites/FX/floorJump2_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0010.png", __ASSET__assets_images_sprites_fx_floorjump2_0010_png);
		type.set ("assets/images/sprites/FX/floorJump2_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0011.png", __ASSET__assets_images_sprites_fx_floorjump2_0011_png);
		type.set ("assets/images/sprites/FX/floorJump2_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0012.png", __ASSET__assets_images_sprites_fx_floorjump2_0012_png);
		type.set ("assets/images/sprites/FX/floorJump2_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0013.png", __ASSET__assets_images_sprites_fx_floorjump2_0013_png);
		type.set ("assets/images/sprites/FX/floorJump2_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0014.png", __ASSET__assets_images_sprites_fx_floorjump2_0014_png);
		type.set ("assets/images/sprites/FX/floorJump2_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0015.png", __ASSET__assets_images_sprites_fx_floorjump2_0015_png);
		type.set ("assets/images/sprites/FX/floorJump2_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0016.png", __ASSET__assets_images_sprites_fx_floorjump2_0016_png);
		type.set ("assets/images/sprites/FX/floorJump2_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0017.png", __ASSET__assets_images_sprites_fx_floorjump2_0017_png);
		type.set ("assets/images/sprites/FX/floorJump2_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0018.png", __ASSET__assets_images_sprites_fx_floorjump2_0018_png);
		type.set ("assets/images/sprites/FX/floorJump2_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/floorJump2_0019.png", __ASSET__assets_images_sprites_fx_floorjump2_0019_png);
		type.set ("assets/images/sprites/FX/floorJump2_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0001.png", __ASSET__assets_images_sprites_fx_fx_run_0001_png);
		type.set ("assets/images/sprites/FX/fx_run_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0002.png", __ASSET__assets_images_sprites_fx_fx_run_0002_png);
		type.set ("assets/images/sprites/FX/fx_run_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0003.png", __ASSET__assets_images_sprites_fx_fx_run_0003_png);
		type.set ("assets/images/sprites/FX/fx_run_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0004.png", __ASSET__assets_images_sprites_fx_fx_run_0004_png);
		type.set ("assets/images/sprites/FX/fx_run_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0005.png", __ASSET__assets_images_sprites_fx_fx_run_0005_png);
		type.set ("assets/images/sprites/FX/fx_run_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0006.png", __ASSET__assets_images_sprites_fx_fx_run_0006_png);
		type.set ("assets/images/sprites/FX/fx_run_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0007.png", __ASSET__assets_images_sprites_fx_fx_run_0007_png);
		type.set ("assets/images/sprites/FX/fx_run_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0008.png", __ASSET__assets_images_sprites_fx_fx_run_0008_png);
		type.set ("assets/images/sprites/FX/fx_run_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0009.png", __ASSET__assets_images_sprites_fx_fx_run_0009_png);
		type.set ("assets/images/sprites/FX/fx_run_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0010.png", __ASSET__assets_images_sprites_fx_fx_run_0010_png);
		type.set ("assets/images/sprites/FX/fx_run_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0011.png", __ASSET__assets_images_sprites_fx_fx_run_0011_png);
		type.set ("assets/images/sprites/FX/fx_run_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0012.png", __ASSET__assets_images_sprites_fx_fx_run_0012_png);
		type.set ("assets/images/sprites/FX/fx_run_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0013.png", __ASSET__assets_images_sprites_fx_fx_run_0013_png);
		type.set ("assets/images/sprites/FX/fx_run_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/fx_run_0014.png", __ASSET__assets_images_sprites_fx_fx_run_0014_png);
		type.set ("assets/images/sprites/FX/fx_run_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0001.png", __ASSET__assets_images_sprites_fx_swordhit0001_png);
		type.set ("assets/images/sprites/FX/swordHit0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0002.png", __ASSET__assets_images_sprites_fx_swordhit0002_png);
		type.set ("assets/images/sprites/FX/swordHit0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0003.png", __ASSET__assets_images_sprites_fx_swordhit0003_png);
		type.set ("assets/images/sprites/FX/swordHit0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0004.png", __ASSET__assets_images_sprites_fx_swordhit0004_png);
		type.set ("assets/images/sprites/FX/swordHit0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0005.png", __ASSET__assets_images_sprites_fx_swordhit0005_png);
		type.set ("assets/images/sprites/FX/swordHit0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0006.png", __ASSET__assets_images_sprites_fx_swordhit0006_png);
		type.set ("assets/images/sprites/FX/swordHit0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0007.png", __ASSET__assets_images_sprites_fx_swordhit0007_png);
		type.set ("assets/images/sprites/FX/swordHit0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0008.png", __ASSET__assets_images_sprites_fx_swordhit0008_png);
		type.set ("assets/images/sprites/FX/swordHit0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0009.png", __ASSET__assets_images_sprites_fx_swordhit0009_png);
		type.set ("assets/images/sprites/FX/swordHit0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0010.png", __ASSET__assets_images_sprites_fx_swordhit0010_png);
		type.set ("assets/images/sprites/FX/swordHit0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/swordHit0011.png", __ASSET__assets_images_sprites_fx_swordhit0011_png);
		type.set ("assets/images/sprites/FX/swordHit0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0001.png", __ASSET__assets_images_sprites_fx_wallloop_0001_png);
		type.set ("assets/images/sprites/FX/wallLoop_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0002.png", __ASSET__assets_images_sprites_fx_wallloop_0002_png);
		type.set ("assets/images/sprites/FX/wallLoop_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0003.png", __ASSET__assets_images_sprites_fx_wallloop_0003_png);
		type.set ("assets/images/sprites/FX/wallLoop_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0004.png", __ASSET__assets_images_sprites_fx_wallloop_0004_png);
		type.set ("assets/images/sprites/FX/wallLoop_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0005.png", __ASSET__assets_images_sprites_fx_wallloop_0005_png);
		type.set ("assets/images/sprites/FX/wallLoop_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0006.png", __ASSET__assets_images_sprites_fx_wallloop_0006_png);
		type.set ("assets/images/sprites/FX/wallLoop_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0007.png", __ASSET__assets_images_sprites_fx_wallloop_0007_png);
		type.set ("assets/images/sprites/FX/wallLoop_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0008.png", __ASSET__assets_images_sprites_fx_wallloop_0008_png);
		type.set ("assets/images/sprites/FX/wallLoop_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0009.png", __ASSET__assets_images_sprites_fx_wallloop_0009_png);
		type.set ("assets/images/sprites/FX/wallLoop_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0010.png", __ASSET__assets_images_sprites_fx_wallloop_0010_png);
		type.set ("assets/images/sprites/FX/wallLoop_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0011.png", __ASSET__assets_images_sprites_fx_wallloop_0011_png);
		type.set ("assets/images/sprites/FX/wallLoop_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0012.png", __ASSET__assets_images_sprites_fx_wallloop_0012_png);
		type.set ("assets/images/sprites/FX/wallLoop_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0013.png", __ASSET__assets_images_sprites_fx_wallloop_0013_png);
		type.set ("assets/images/sprites/FX/wallLoop_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0014.png", __ASSET__assets_images_sprites_fx_wallloop_0014_png);
		type.set ("assets/images/sprites/FX/wallLoop_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0015.png", __ASSET__assets_images_sprites_fx_wallloop_0015_png);
		type.set ("assets/images/sprites/FX/wallLoop_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0016.png", __ASSET__assets_images_sprites_fx_wallloop_0016_png);
		type.set ("assets/images/sprites/FX/wallLoop_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0017.png", __ASSET__assets_images_sprites_fx_wallloop_0017_png);
		type.set ("assets/images/sprites/FX/wallLoop_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0018.png", __ASSET__assets_images_sprites_fx_wallloop_0018_png);
		type.set ("assets/images/sprites/FX/wallLoop_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0019.png", __ASSET__assets_images_sprites_fx_wallloop_0019_png);
		type.set ("assets/images/sprites/FX/wallLoop_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/FX/wallLoop_0020.png", __ASSET__assets_images_sprites_fx_wallloop_0020_png);
		type.set ("assets/images/sprites/FX/wallLoop_0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png", __ASSET__assets_images_sprites_punk__punk_attack_floorside_0001removed_png);
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png", __ASSET__assets_images_sprites_punk__punk_attack_floorside_0015removed_png);
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png", __ASSET__assets_images_sprites_punk__punk_attack_floorside_0016removed_png);
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png", __ASSET__assets_images_sprites_punk__punk_attack_floorside_0017removed_png);
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png", __ASSET__assets_images_sprites_punk__punk_attack_floorside_0018removed_png);
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0001.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0001_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0002.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0002_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0003.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0003_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0004.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0004_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0005.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0005_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0006.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0006_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0007.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0007_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0008.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0008_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0009.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0009_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0010.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0010_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0011.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0011_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0012.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0012_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0013.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0013_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0014.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0014_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0015.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0015_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0016.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0016_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0017.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0017_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0018.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0018_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0019.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0019_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0002.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0002_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0003.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0003_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0004.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0004_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0005.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0005_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0006.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0006_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0007.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0007_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0008.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0008_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0009.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0009_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0010.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0010_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0011.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0011_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0012.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0012_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0013.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0013_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0014.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0014_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0001.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0001_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0002.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0002_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0003.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0003_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0004.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0004_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0005.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0005_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0006.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0006_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0007.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0007_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0008.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0008_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0009.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0009_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0010.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0010_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0011.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0011_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0012.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0012_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0013.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0013_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0014.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0014_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0015.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0015_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_dash_.png", __ASSET__assets_images_sprites_punk_punk_dash__png);
		type.set ("assets/images/sprites/punk/punk_dash_.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0001.png", __ASSET__assets_images_sprites_punk_punk_death_0001_png);
		type.set ("assets/images/sprites/punk/punk_death_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0002.png", __ASSET__assets_images_sprites_punk_punk_death_0002_png);
		type.set ("assets/images/sprites/punk/punk_death_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0003.png", __ASSET__assets_images_sprites_punk_punk_death_0003_png);
		type.set ("assets/images/sprites/punk/punk_death_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0004.png", __ASSET__assets_images_sprites_punk_punk_death_0004_png);
		type.set ("assets/images/sprites/punk/punk_death_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0005.png", __ASSET__assets_images_sprites_punk_punk_death_0005_png);
		type.set ("assets/images/sprites/punk/punk_death_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0006.png", __ASSET__assets_images_sprites_punk_punk_death_0006_png);
		type.set ("assets/images/sprites/punk/punk_death_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0007.png", __ASSET__assets_images_sprites_punk_punk_death_0007_png);
		type.set ("assets/images/sprites/punk/punk_death_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0008.png", __ASSET__assets_images_sprites_punk_punk_death_0008_png);
		type.set ("assets/images/sprites/punk/punk_death_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0009.png", __ASSET__assets_images_sprites_punk_punk_death_0009_png);
		type.set ("assets/images/sprites/punk/punk_death_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0010.png", __ASSET__assets_images_sprites_punk_punk_death_0010_png);
		type.set ("assets/images/sprites/punk/punk_death_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0011.png", __ASSET__assets_images_sprites_punk_punk_death_0011_png);
		type.set ("assets/images/sprites/punk/punk_death_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0012.png", __ASSET__assets_images_sprites_punk_punk_death_0012_png);
		type.set ("assets/images/sprites/punk/punk_death_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0013.png", __ASSET__assets_images_sprites_punk_punk_death_0013_png);
		type.set ("assets/images/sprites/punk/punk_death_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0014.png", __ASSET__assets_images_sprites_punk_punk_death_0014_png);
		type.set ("assets/images/sprites/punk/punk_death_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0015.png", __ASSET__assets_images_sprites_punk_punk_death_0015_png);
		type.set ("assets/images/sprites/punk/punk_death_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0016.png", __ASSET__assets_images_sprites_punk_punk_death_0016_png);
		type.set ("assets/images/sprites/punk/punk_death_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0017.png", __ASSET__assets_images_sprites_punk_punk_death_0017_png);
		type.set ("assets/images/sprites/punk/punk_death_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0018.png", __ASSET__assets_images_sprites_punk_punk_death_0018_png);
		type.set ("assets/images/sprites/punk/punk_death_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0019.png", __ASSET__assets_images_sprites_punk_punk_death_0019_png);
		type.set ("assets/images/sprites/punk/punk_death_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0020.png", __ASSET__assets_images_sprites_punk_punk_death_0020_png);
		type.set ("assets/images/sprites/punk/punk_death_0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0021.png", __ASSET__assets_images_sprites_punk_punk_death_0021_png);
		type.set ("assets/images/sprites/punk/punk_death_0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0022.png", __ASSET__assets_images_sprites_punk_punk_death_0022_png);
		type.set ("assets/images/sprites/punk/punk_death_0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0023.png", __ASSET__assets_images_sprites_punk_punk_death_0023_png);
		type.set ("assets/images/sprites/punk/punk_death_0023.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0024.png", __ASSET__assets_images_sprites_punk_punk_death_0024_png);
		type.set ("assets/images/sprites/punk/punk_death_0024.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0025.png", __ASSET__assets_images_sprites_punk_punk_death_0025_png);
		type.set ("assets/images/sprites/punk/punk_death_0025.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0026.png", __ASSET__assets_images_sprites_punk_punk_death_0026_png);
		type.set ("assets/images/sprites/punk/punk_death_0026.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0027.png", __ASSET__assets_images_sprites_punk_punk_death_0027_png);
		type.set ("assets/images/sprites/punk/punk_death_0027.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0028.png", __ASSET__assets_images_sprites_punk_punk_death_0028_png);
		type.set ("assets/images/sprites/punk/punk_death_0028.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0029.png", __ASSET__assets_images_sprites_punk_punk_death_0029_png);
		type.set ("assets/images/sprites/punk/punk_death_0029.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0030.png", __ASSET__assets_images_sprites_punk_punk_death_0030_png);
		type.set ("assets/images/sprites/punk/punk_death_0030.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0031.png", __ASSET__assets_images_sprites_punk_punk_death_0031_png);
		type.set ("assets/images/sprites/punk/punk_death_0031.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0032.png", __ASSET__assets_images_sprites_punk_punk_death_0032_png);
		type.set ("assets/images/sprites/punk/punk_death_0032.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0033.png", __ASSET__assets_images_sprites_punk_punk_death_0033_png);
		type.set ("assets/images/sprites/punk/punk_death_0033.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0034.png", __ASSET__assets_images_sprites_punk_punk_death_0034_png);
		type.set ("assets/images/sprites/punk/punk_death_0034.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0035.png", __ASSET__assets_images_sprites_punk_punk_death_0035_png);
		type.set ("assets/images/sprites/punk/punk_death_0035.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0036.png", __ASSET__assets_images_sprites_punk_punk_death_0036_png);
		type.set ("assets/images/sprites/punk/punk_death_0036.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0037.png", __ASSET__assets_images_sprites_punk_punk_death_0037_png);
		type.set ("assets/images/sprites/punk/punk_death_0037.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0038.png", __ASSET__assets_images_sprites_punk_punk_death_0038_png);
		type.set ("assets/images/sprites/punk/punk_death_0038.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0039.png", __ASSET__assets_images_sprites_punk_punk_death_0039_png);
		type.set ("assets/images/sprites/punk/punk_death_0039.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0040.png", __ASSET__assets_images_sprites_punk_punk_death_0040_png);
		type.set ("assets/images/sprites/punk/punk_death_0040.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0041.png", __ASSET__assets_images_sprites_punk_punk_death_0041_png);
		type.set ("assets/images/sprites/punk/punk_death_0041.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0042.png", __ASSET__assets_images_sprites_punk_punk_death_0042_png);
		type.set ("assets/images/sprites/punk/punk_death_0042.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0043.png", __ASSET__assets_images_sprites_punk_punk_death_0043_png);
		type.set ("assets/images/sprites/punk/punk_death_0043.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0044.png", __ASSET__assets_images_sprites_punk_punk_death_0044_png);
		type.set ("assets/images/sprites/punk/punk_death_0044.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0045.png", __ASSET__assets_images_sprites_punk_punk_death_0045_png);
		type.set ("assets/images/sprites/punk/punk_death_0045.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_death_0046.png", __ASSET__assets_images_sprites_punk_punk_death_0046_png);
		type.set ("assets/images/sprites/punk/punk_death_0046.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0001.png", __ASSET__assets_images_sprites_punk_punk_idle_0001_png);
		type.set ("assets/images/sprites/punk/punk_idle_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0002.png", __ASSET__assets_images_sprites_punk_punk_idle_0002_png);
		type.set ("assets/images/sprites/punk/punk_idle_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0003.png", __ASSET__assets_images_sprites_punk_punk_idle_0003_png);
		type.set ("assets/images/sprites/punk/punk_idle_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0004.png", __ASSET__assets_images_sprites_punk_punk_idle_0004_png);
		type.set ("assets/images/sprites/punk/punk_idle_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0005.png", __ASSET__assets_images_sprites_punk_punk_idle_0005_png);
		type.set ("assets/images/sprites/punk/punk_idle_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0006.png", __ASSET__assets_images_sprites_punk_punk_idle_0006_png);
		type.set ("assets/images/sprites/punk/punk_idle_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0007.png", __ASSET__assets_images_sprites_punk_punk_idle_0007_png);
		type.set ("assets/images/sprites/punk/punk_idle_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0008.png", __ASSET__assets_images_sprites_punk_punk_idle_0008_png);
		type.set ("assets/images/sprites/punk/punk_idle_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0009.png", __ASSET__assets_images_sprites_punk_punk_idle_0009_png);
		type.set ("assets/images/sprites/punk/punk_idle_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0010.png", __ASSET__assets_images_sprites_punk_punk_idle_0010_png);
		type.set ("assets/images/sprites/punk/punk_idle_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0011.png", __ASSET__assets_images_sprites_punk_punk_idle_0011_png);
		type.set ("assets/images/sprites/punk/punk_idle_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0012.png", __ASSET__assets_images_sprites_punk_punk_idle_0012_png);
		type.set ("assets/images/sprites/punk/punk_idle_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0013.png", __ASSET__assets_images_sprites_punk_punk_idle_0013_png);
		type.set ("assets/images/sprites/punk/punk_idle_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0014.png", __ASSET__assets_images_sprites_punk_punk_idle_0014_png);
		type.set ("assets/images/sprites/punk/punk_idle_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0015.png", __ASSET__assets_images_sprites_punk_punk_idle_0015_png);
		type.set ("assets/images/sprites/punk/punk_idle_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0016.png", __ASSET__assets_images_sprites_punk_punk_idle_0016_png);
		type.set ("assets/images/sprites/punk/punk_idle_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0017.png", __ASSET__assets_images_sprites_punk_punk_idle_0017_png);
		type.set ("assets/images/sprites/punk/punk_idle_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0018.png", __ASSET__assets_images_sprites_punk_punk_idle_0018_png);
		type.set ("assets/images/sprites/punk/punk_idle_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0019.png", __ASSET__assets_images_sprites_punk_punk_idle_0019_png);
		type.set ("assets/images/sprites/punk/punk_idle_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0020.png", __ASSET__assets_images_sprites_punk_punk_idle_0020_png);
		type.set ("assets/images/sprites/punk/punk_idle_0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0021.png", __ASSET__assets_images_sprites_punk_punk_idle_0021_png);
		type.set ("assets/images/sprites/punk/punk_idle_0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0022.png", __ASSET__assets_images_sprites_punk_punk_idle_0022_png);
		type.set ("assets/images/sprites/punk/punk_idle_0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0023.png", __ASSET__assets_images_sprites_punk_punk_idle_0023_png);
		type.set ("assets/images/sprites/punk/punk_idle_0023.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0024.png", __ASSET__assets_images_sprites_punk_punk_idle_0024_png);
		type.set ("assets/images/sprites/punk/punk_idle_0024.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_idle_0025.png", __ASSET__assets_images_sprites_punk_punk_idle_0025_png);
		type.set ("assets/images/sprites/punk/punk_idle_0025.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_jumpDown_0001.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0001_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_jumpDown_0002.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0002_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_jumpDown_0003.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0003_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_jumpDown_0004.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0004_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_jumpDown_0005.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0005_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_jumpDown_0006.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0006_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/punk_walljump_0001.png", __ASSET__assets_images_sprites_punk_punk_walljump_0001_png);
		type.set ("assets/images/sprites/punk/punk_walljump_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0001.png", __ASSET__assets_images_sprites_punk_runpunk_0001_png);
		type.set ("assets/images/sprites/punk/runPunk_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0002.png", __ASSET__assets_images_sprites_punk_runpunk_0002_png);
		type.set ("assets/images/sprites/punk/runPunk_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0003.png", __ASSET__assets_images_sprites_punk_runpunk_0003_png);
		type.set ("assets/images/sprites/punk/runPunk_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0004.png", __ASSET__assets_images_sprites_punk_runpunk_0004_png);
		type.set ("assets/images/sprites/punk/runPunk_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0005.png", __ASSET__assets_images_sprites_punk_runpunk_0005_png);
		type.set ("assets/images/sprites/punk/runPunk_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0006.png", __ASSET__assets_images_sprites_punk_runpunk_0006_png);
		type.set ("assets/images/sprites/punk/runPunk_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0007.png", __ASSET__assets_images_sprites_punk_runpunk_0007_png);
		type.set ("assets/images/sprites/punk/runPunk_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0008.png", __ASSET__assets_images_sprites_punk_runpunk_0008_png);
		type.set ("assets/images/sprites/punk/runPunk_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0009.png", __ASSET__assets_images_sprites_punk_runpunk_0009_png);
		type.set ("assets/images/sprites/punk/runPunk_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0010.png", __ASSET__assets_images_sprites_punk_runpunk_0010_png);
		type.set ("assets/images/sprites/punk/runPunk_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0011.png", __ASSET__assets_images_sprites_punk_runpunk_0011_png);
		type.set ("assets/images/sprites/punk/runPunk_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0012.png", __ASSET__assets_images_sprites_punk_runpunk_0012_png);
		type.set ("assets/images/sprites/punk/runPunk_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0013.png", __ASSET__assets_images_sprites_punk_runpunk_0013_png);
		type.set ("assets/images/sprites/punk/runPunk_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0014.png", __ASSET__assets_images_sprites_punk_runpunk_0014_png);
		type.set ("assets/images/sprites/punk/runPunk_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0015.png", __ASSET__assets_images_sprites_punk_runpunk_0015_png);
		type.set ("assets/images/sprites/punk/runPunk_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0016.png", __ASSET__assets_images_sprites_punk_runpunk_0016_png);
		type.set ("assets/images/sprites/punk/runPunk_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0017.png", __ASSET__assets_images_sprites_punk_runpunk_0017_png);
		type.set ("assets/images/sprites/punk/runPunk_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0018.png", __ASSET__assets_images_sprites_punk_runpunk_0018_png);
		type.set ("assets/images/sprites/punk/runPunk_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0019.png", __ASSET__assets_images_sprites_punk_runpunk_0019_png);
		type.set ("assets/images/sprites/punk/runPunk_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0020.png", __ASSET__assets_images_sprites_punk_runpunk_0020_png);
		type.set ("assets/images/sprites/punk/runPunk_0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0021.png", __ASSET__assets_images_sprites_punk_runpunk_0021_png);
		type.set ("assets/images/sprites/punk/runPunk_0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0022.png", __ASSET__assets_images_sprites_punk_runpunk_0022_png);
		type.set ("assets/images/sprites/punk/runPunk_0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0023.png", __ASSET__assets_images_sprites_punk_runpunk_0023_png);
		type.set ("assets/images/sprites/punk/runPunk_0023.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/punk/runPunk_0024.png", __ASSET__assets_images_sprites_punk_runpunk_0024_png);
		type.set ("assets/images/sprites/punk/runPunk_0024.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/bombo_big_load_0001.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0001_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/bombo_big_load_0002.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0002_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/bombo_big_load_0003.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0003_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/bombo_big_load_0004.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0004_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/bombo_big_load_0005.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0005_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/bombo_big_load_0006.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0006_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/bombo_big_load_0007.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0007_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/bombo_big_load_0008.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0008_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/bomb_big_white_0001.png", __ASSET__assets_images_sprites_pups_bomb_big_white_0001_png);
		type.set ("assets/images/sprites/pUps/bomb_big_white_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/bomb_big_white_0002.png", __ASSET__assets_images_sprites_pups_bomb_big_white_0002_png);
		type.set ("assets/images/sprites/pUps/bomb_big_white_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/Crate.png", __ASSET__assets_images_sprites_pups_crate_png);
		type.set ("assets/images/sprites/pUps/Crate.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0001.png", __ASSET__assets_images_sprites_pups_explosion_0001_png);
		type.set ("assets/images/sprites/pUps/explosion_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0002.png", __ASSET__assets_images_sprites_pups_explosion_0002_png);
		type.set ("assets/images/sprites/pUps/explosion_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0003.png", __ASSET__assets_images_sprites_pups_explosion_0003_png);
		type.set ("assets/images/sprites/pUps/explosion_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0004.png", __ASSET__assets_images_sprites_pups_explosion_0004_png);
		type.set ("assets/images/sprites/pUps/explosion_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0005.png", __ASSET__assets_images_sprites_pups_explosion_0005_png);
		type.set ("assets/images/sprites/pUps/explosion_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0006.png", __ASSET__assets_images_sprites_pups_explosion_0006_png);
		type.set ("assets/images/sprites/pUps/explosion_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0007.png", __ASSET__assets_images_sprites_pups_explosion_0007_png);
		type.set ("assets/images/sprites/pUps/explosion_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0008.png", __ASSET__assets_images_sprites_pups_explosion_0008_png);
		type.set ("assets/images/sprites/pUps/explosion_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0009.png", __ASSET__assets_images_sprites_pups_explosion_0009_png);
		type.set ("assets/images/sprites/pUps/explosion_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0010.png", __ASSET__assets_images_sprites_pups_explosion_0010_png);
		type.set ("assets/images/sprites/pUps/explosion_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0011.png", __ASSET__assets_images_sprites_pups_explosion_0011_png);
		type.set ("assets/images/sprites/pUps/explosion_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0012.png", __ASSET__assets_images_sprites_pups_explosion_0012_png);
		type.set ("assets/images/sprites/pUps/explosion_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0013.png", __ASSET__assets_images_sprites_pups_explosion_0013_png);
		type.set ("assets/images/sprites/pUps/explosion_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0014.png", __ASSET__assets_images_sprites_pups_explosion_0014_png);
		type.set ("assets/images/sprites/pUps/explosion_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0015.png", __ASSET__assets_images_sprites_pups_explosion_0015_png);
		type.set ("assets/images/sprites/pUps/explosion_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0016.png", __ASSET__assets_images_sprites_pups_explosion_0016_png);
		type.set ("assets/images/sprites/pUps/explosion_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0017.png", __ASSET__assets_images_sprites_pups_explosion_0017_png);
		type.set ("assets/images/sprites/pUps/explosion_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0018.png", __ASSET__assets_images_sprites_pups_explosion_0018_png);
		type.set ("assets/images/sprites/pUps/explosion_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0019.png", __ASSET__assets_images_sprites_pups_explosion_0019_png);
		type.set ("assets/images/sprites/pUps/explosion_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0020.png", __ASSET__assets_images_sprites_pups_explosion_0020_png);
		type.set ("assets/images/sprites/pUps/explosion_0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0021.png", __ASSET__assets_images_sprites_pups_explosion_0021_png);
		type.set ("assets/images/sprites/pUps/explosion_0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0022.png", __ASSET__assets_images_sprites_pups_explosion_0022_png);
		type.set ("assets/images/sprites/pUps/explosion_0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0023.png", __ASSET__assets_images_sprites_pups_explosion_0023_png);
		type.set ("assets/images/sprites/pUps/explosion_0023.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0024.png", __ASSET__assets_images_sprites_pups_explosion_0024_png);
		type.set ("assets/images/sprites/pUps/explosion_0024.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0025.png", __ASSET__assets_images_sprites_pups_explosion_0025_png);
		type.set ("assets/images/sprites/pUps/explosion_0025.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0026.png", __ASSET__assets_images_sprites_pups_explosion_0026_png);
		type.set ("assets/images/sprites/pUps/explosion_0026.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0027.png", __ASSET__assets_images_sprites_pups_explosion_0027_png);
		type.set ("assets/images/sprites/pUps/explosion_0027.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0028.png", __ASSET__assets_images_sprites_pups_explosion_0028_png);
		type.set ("assets/images/sprites/pUps/explosion_0028.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0029.png", __ASSET__assets_images_sprites_pups_explosion_0029_png);
		type.set ("assets/images/sprites/pUps/explosion_0029.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0030.png", __ASSET__assets_images_sprites_pups_explosion_0030_png);
		type.set ("assets/images/sprites/pUps/explosion_0030.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0031.png", __ASSET__assets_images_sprites_pups_explosion_0031_png);
		type.set ("assets/images/sprites/pUps/explosion_0031.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0032.png", __ASSET__assets_images_sprites_pups_explosion_0032_png);
		type.set ("assets/images/sprites/pUps/explosion_0032.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0033.png", __ASSET__assets_images_sprites_pups_explosion_0033_png);
		type.set ("assets/images/sprites/pUps/explosion_0033.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0034.png", __ASSET__assets_images_sprites_pups_explosion_0034_png);
		type.set ("assets/images/sprites/pUps/explosion_0034.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0035.png", __ASSET__assets_images_sprites_pups_explosion_0035_png);
		type.set ("assets/images/sprites/pUps/explosion_0035.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/explosion_0036.png", __ASSET__assets_images_sprites_pups_explosion_0036_png);
		type.set ("assets/images/sprites/pUps/explosion_0036.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0001.png", __ASSET__assets_images_sprites_pups_magnet_main_0001_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0001.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0002.png", __ASSET__assets_images_sprites_pups_magnet_main_0002_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0002.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0003.png", __ASSET__assets_images_sprites_pups_magnet_main_0003_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0003.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0004.png", __ASSET__assets_images_sprites_pups_magnet_main_0004_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0004.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0005.png", __ASSET__assets_images_sprites_pups_magnet_main_0005_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0005.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0006.png", __ASSET__assets_images_sprites_pups_magnet_main_0006_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0006.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0007.png", __ASSET__assets_images_sprites_pups_magnet_main_0007_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0007.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0008.png", __ASSET__assets_images_sprites_pups_magnet_main_0008_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0008.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0009.png", __ASSET__assets_images_sprites_pups_magnet_main_0009_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0009.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0010.png", __ASSET__assets_images_sprites_pups_magnet_main_0010_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0010.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0011.png", __ASSET__assets_images_sprites_pups_magnet_main_0011_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0011.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0012.png", __ASSET__assets_images_sprites_pups_magnet_main_0012_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0012.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0013.png", __ASSET__assets_images_sprites_pups_magnet_main_0013_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0013.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0014.png", __ASSET__assets_images_sprites_pups_magnet_main_0014_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0014.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0015.png", __ASSET__assets_images_sprites_pups_magnet_main_0015_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0015.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0016.png", __ASSET__assets_images_sprites_pups_magnet_main_0016_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0016.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0017.png", __ASSET__assets_images_sprites_pups_magnet_main_0017_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0017.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0018.png", __ASSET__assets_images_sprites_pups_magnet_main_0018_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0018.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0019.png", __ASSET__assets_images_sprites_pups_magnet_main_0019_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0019.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0020.png", __ASSET__assets_images_sprites_pups_magnet_main_0020_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0020.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0021.png", __ASSET__assets_images_sprites_pups_magnet_main_0021_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0021.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0022.png", __ASSET__assets_images_sprites_pups_magnet_main_0022_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0022.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0023.png", __ASSET__assets_images_sprites_pups_magnet_main_0023_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0023.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0024.png", __ASSET__assets_images_sprites_pups_magnet_main_0024_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0024.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0025.png", __ASSET__assets_images_sprites_pups_magnet_main_0025_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0025.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0026.png", __ASSET__assets_images_sprites_pups_magnet_main_0026_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0026.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0027.png", __ASSET__assets_images_sprites_pups_magnet_main_0027_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0027.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0028.png", __ASSET__assets_images_sprites_pups_magnet_main_0028_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0028.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0029.png", __ASSET__assets_images_sprites_pups_magnet_main_0029_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0029.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0030.png", __ASSET__assets_images_sprites_pups_magnet_main_0030_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0030.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0031.png", __ASSET__assets_images_sprites_pups_magnet_main_0031_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0031.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0032.png", __ASSET__assets_images_sprites_pups_magnet_main_0032_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0032.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0033.png", __ASSET__assets_images_sprites_pups_magnet_main_0033_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0033.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0034.png", __ASSET__assets_images_sprites_pups_magnet_main_0034_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0034.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0035.png", __ASSET__assets_images_sprites_pups_magnet_main_0035_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0035.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0036.png", __ASSET__assets_images_sprites_pups_magnet_main_0036_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0036.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0037.png", __ASSET__assets_images_sprites_pups_magnet_main_0037_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0037.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0038.png", __ASSET__assets_images_sprites_pups_magnet_main_0038_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0038.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0039.png", __ASSET__assets_images_sprites_pups_magnet_main_0039_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0039.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0040.png", __ASSET__assets_images_sprites_pups_magnet_main_0040_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0040.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0041.png", __ASSET__assets_images_sprites_pups_magnet_main_0041_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0041.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0042.png", __ASSET__assets_images_sprites_pups_magnet_main_0042_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0042.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0043.png", __ASSET__assets_images_sprites_pups_magnet_main_0043_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0043.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0044.png", __ASSET__assets_images_sprites_pups_magnet_main_0044_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0044.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0045.png", __ASSET__assets_images_sprites_pups_magnet_main_0045_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0045.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0046.png", __ASSET__assets_images_sprites_pups_magnet_main_0046_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0046.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0047.png", __ASSET__assets_images_sprites_pups_magnet_main_0047_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0047.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_main_0048.png", __ASSET__assets_images_sprites_pups_magnet_main_0048_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0048.png", AssetType.IMAGE);
		className.set ("assets/images/sprites/pUps/magnet_solo.png", __ASSET__assets_images_sprites_pups_magnet_solo_png);
		type.set ("assets/images/sprites/pUps/magnet_solo.png", AssetType.IMAGE);
		className.set ("assets/images/spritesheetTp.png", __ASSET__assets_images_spritesheettp_png);
		type.set ("assets/images/spritesheetTp.png", AssetType.IMAGE);
		className.set ("assets/images/tile01.png", __ASSET__assets_images_tile01_png);
		type.set ("assets/images/tile01.png", AssetType.IMAGE);
		className.set ("assets/images/towerfall_test2_002.png", __ASSET__assets_images_towerfall_test2_002_png);
		type.set ("assets/images/towerfall_test2_002.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/backloop.ogg", __ASSET__assets_sounds_backloop_ogg);
		type.set ("assets/sounds/backloop.ogg", AssetType.MUSIC);
		className.set ("assets/sounds/clash.mp3", __ASSET__assets_sounds_clash_mp3);
		type.set ("assets/sounds/clash.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/clash.ogg", __ASSET__assets_sounds_clash_ogg);
		type.set ("assets/sounds/clash.ogg", AssetType.SOUND);
		className.set ("assets/sounds/electrify.ogg", __ASSET__assets_sounds_electrify_ogg);
		type.set ("assets/sounds/electrify.ogg", AssetType.SOUND);
		className.set ("assets/sounds/explode.ogg", __ASSET__assets_sounds_explode_ogg);
		type.set ("assets/sounds/explode.ogg", AssetType.SOUND);
		className.set ("assets/sounds/explodemini.wav", __ASSET__assets_sounds_explodemini_wav);
		type.set ("assets/sounds/explodemini.wav", AssetType.SOUND);
		className.set ("assets/sounds/hurt.mp3", __ASSET__assets_sounds_hurt_mp3);
		type.set ("assets/sounds/hurt.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/hurt.ogg", __ASSET__assets_sounds_hurt_ogg);
		type.set ("assets/sounds/hurt.ogg", AssetType.SOUND);
		className.set ("assets/sounds/jump.ogg", __ASSET__assets_sounds_jump_ogg);
		type.set ("assets/sounds/jump.ogg", AssetType.SOUND);
		className.set ("assets/sounds/magnet_appear.ogg", __ASSET__assets_sounds_magnet_appear_ogg);
		type.set ("assets/sounds/magnet_appear.ogg", AssetType.SOUND);
		className.set ("assets/sounds/slash.mp3", __ASSET__assets_sounds_slash_mp3);
		type.set ("assets/sounds/slash.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/slash.ogg", __ASSET__assets_sounds_slash_ogg);
		type.set ("assets/sounds/slash.ogg", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/touch_ground.ogg", __ASSET__assets_sounds_touch_ground_ogg);
		type.set ("assets/sounds/touch_ground.ogg", AssetType.SOUND);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		className.set ("clash", __ASSET__assets_sounds_clash_mp4);
		type.set ("clash", AssetType.SOUND);
		className.set ("slash", __ASSET__assets_sounds_slash_mp4);
		type.set ("slash", AssetType.SOUND);
		className.set ("hurt", __ASSET__assets_sounds_hurt_mp4);
		type.set ("hurt", AssetType.SOUND);
		className.set ("electrify", __ASSET__assets_sounds_hurt_mp5);
		type.set ("electrify", AssetType.SOUND);
		className.set ("background", __ASSET__assets_sounds_hurt_mp6);
		type.set ("background", AssetType.SOUND);
		className.set ("magnet_appear", __ASSET__assets_sounds_hurt_mp7);
		type.set ("magnet_appear", AssetType.SOUND);
		className.set ("touch_ground", __ASSET__assets_sounds_hurt_mp8);
		type.set ("touch_ground", AssetType.SOUND);
		className.set ("jump", __ASSET__assets_sounds_hurt_mp9);
		type.set ("jump", AssetType.SOUND);
		className.set ("explode", __ASSET__assets_sounds_hurt_mp10);
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
		id = "assets/images/sprites/pUps/magnet_main_0001.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0002.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0003.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0004.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0005.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0006.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0007.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0008.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0009.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0010.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0011.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0012.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0013.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0014.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0015.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0016.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0017.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0018.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0019.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0020.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0021.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0022.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0023.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0024.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0025.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0026.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0027.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0028.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0029.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0030.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0031.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0032.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0033.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0034.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0035.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0036.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0037.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0038.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0039.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0040.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0041.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0042.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0043.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0044.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0045.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0046.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0047.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_main_0048.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprites/pUps/magnet_solo.png";
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
		id = "assets/sounds/backloop.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/clash.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/clash.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/electrify.ogg";
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
		id = "assets/sounds/jump.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/magnet_appear.ogg";
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
		id = "assets/sounds/touch_ground.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		id = "clash";
		path.set (id, "assets/sounds/clash.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "slash";
		path.set (id, "assets/sounds/slash.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "hurt";
		path.set (id, "assets/sounds/hurt.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "electrify";
		path.set (id, "assets/sounds/hurt.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "background";
		path.set (id, "assets/sounds/hurt.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "magnet_appear";
		path.set (id, "assets/sounds/hurt.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "touch_ground";
		path.set (id, "assets/sounds/hurt.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "jump";
		path.set (id, "assets/sounds/hurt.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "explode";
		path.set (id, "assets/sounds/hurt.mp3");
		
		type.set (id, AssetType.SOUND);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/big version.dam", __ASSET__assets_data_big_version_dam);
		type.set ("assets/data/big version.dam", AssetType.TEXT);
		
		className.set ("assets/data/big version.dam.bak", __ASSET__assets_data_big_version_dam_bak);
		type.set ("assets/data/big version.dam.bak", AssetType.TEXT);
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/mapCSV_Group1_Map1.csv", __ASSET__assets_data_mapcsv_group1_map1_csv);
		type.set ("assets/data/mapCSV_Group1_Map1.csv", AssetType.TEXT);
		
		className.set ("assets/data/megaversion.dam", __ASSET__assets_data_megaversion_dam);
		type.set ("assets/data/megaversion.dam", AssetType.TEXT);
		
		className.set ("assets/data/megaversion.dam.bak", __ASSET__assets_data_megaversion_dam_bak);
		type.set ("assets/data/megaversion.dam.bak", AssetType.TEXT);
		
		className.set ("assets/data/megaversion3.dam", __ASSET__assets_data_megaversion3_dam);
		type.set ("assets/data/megaversion3.dam", AssetType.TEXT);
		
		className.set ("assets/data/spritesData.json", __ASSET__assets_data_spritesdata_json);
		type.set ("assets/data/spritesData.json", AssetType.TEXT);
		
		className.set ("assets/data/texture.tps", __ASSET__assets_data_texture_tps);
		type.set ("assets/data/texture.tps", AssetType.TEXT);
		
		className.set ("assets/data/textureNew.tps", __ASSET__assets_data_texturenew_tps);
		type.set ("assets/data/textureNew.tps", AssetType.TEXT);
		
		className.set ("assets/data/textureWithFolders.tps", __ASSET__assets_data_texturewithfolders_tps);
		type.set ("assets/data/textureWithFolders.tps", AssetType.TEXT);
		
		className.set ("assets/images/1.png", __ASSET__assets_images_1_png);
		type.set ("assets/images/1.png", AssetType.IMAGE);
		
		className.set ("assets/images/2.png", __ASSET__assets_images_2_png);
		type.set ("assets/images/2.png", AssetType.IMAGE);
		
		className.set ("assets/images/charLight.png", __ASSET__assets_images_charlight_png);
		type.set ("assets/images/charLight.png", AssetType.IMAGE);
		
		className.set ("assets/images/cityCartoon_01.swf", __ASSET__assets_images_citycartoon_01_swf);
		type.set ("assets/images/cityCartoon_01.swf", AssetType.TEXT);
		
		className.set ("assets/images/conceptLab.png", __ASSET__assets_images_conceptlab_png);
		type.set ("assets/images/conceptLab.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/ligth.png", __ASSET__assets_images_ligth_png);
		type.set ("assets/images/ligth.png", AssetType.IMAGE);
		
		className.set ("assets/images/marco.png", __ASSET__assets_images_marco_png);
		type.set ("assets/images/marco.png", AssetType.IMAGE);
		
		className.set ("assets/images/piedritas.png", __ASSET__assets_images_piedritas_png);
		type.set ("assets/images/piedritas.png", AssetType.IMAGE);
		
		className.set ("assets/images/sceneLightBlue.png", __ASSET__assets_images_scenelightblue_png);
		type.set ("assets/images/sceneLightBlue.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png", __ASSET__assets_images_sprites_chief__sword_floorsidecutexport0014removed_png);
		type.set ("assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png", __ASSET__assets_images_sprites_chief__sword_floorsidecutexport0015removed_png);
		type.set ("assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0001.png", __ASSET__assets_images_sprites_chief_airdeathexport0001_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0002.png", __ASSET__assets_images_sprites_chief_airdeathexport0002_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0003.png", __ASSET__assets_images_sprites_chief_airdeathexport0003_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0004.png", __ASSET__assets_images_sprites_chief_airdeathexport0004_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0005.png", __ASSET__assets_images_sprites_chief_airdeathexport0005_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0006.png", __ASSET__assets_images_sprites_chief_airdeathexport0006_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0007.png", __ASSET__assets_images_sprites_chief_airdeathexport0007_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0008.png", __ASSET__assets_images_sprites_chief_airdeathexport0008_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0009.png", __ASSET__assets_images_sprites_chief_airdeathexport0009_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0010.png", __ASSET__assets_images_sprites_chief_airdeathexport0010_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0011.png", __ASSET__assets_images_sprites_chief_airdeathexport0011_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0012.png", __ASSET__assets_images_sprites_chief_airdeathexport0012_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0013.png", __ASSET__assets_images_sprites_chief_airdeathexport0013_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0014.png", __ASSET__assets_images_sprites_chief_airdeathexport0014_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0015.png", __ASSET__assets_images_sprites_chief_airdeathexport0015_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0016.png", __ASSET__assets_images_sprites_chief_airdeathexport0016_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0017.png", __ASSET__assets_images_sprites_chief_airdeathexport0017_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0018.png", __ASSET__assets_images_sprites_chief_airdeathexport0018_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0019.png", __ASSET__assets_images_sprites_chief_airdeathexport0019_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0020.png", __ASSET__assets_images_sprites_chief_airdeathexport0020_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0021.png", __ASSET__assets_images_sprites_chief_airdeathexport0021_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0022.png", __ASSET__assets_images_sprites_chief_airdeathexport0022_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0023.png", __ASSET__assets_images_sprites_chief_airdeathexport0023_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0023.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0024.png", __ASSET__assets_images_sprites_chief_airdeathexport0024_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0024.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0025.png", __ASSET__assets_images_sprites_chief_airdeathexport0025_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0025.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0026.png", __ASSET__assets_images_sprites_chief_airdeathexport0026_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0026.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0027.png", __ASSET__assets_images_sprites_chief_airdeathexport0027_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0027.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0028.png", __ASSET__assets_images_sprites_chief_airdeathexport0028_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0028.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0029.png", __ASSET__assets_images_sprites_chief_airdeathexport0029_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0029.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0030.png", __ASSET__assets_images_sprites_chief_airdeathexport0030_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0030.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0031.png", __ASSET__assets_images_sprites_chief_airdeathexport0031_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0031.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0032.png", __ASSET__assets_images_sprites_chief_airdeathexport0032_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0032.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0033.png", __ASSET__assets_images_sprites_chief_airdeathexport0033_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0033.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0034.png", __ASSET__assets_images_sprites_chief_airdeathexport0034_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0034.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0035.png", __ASSET__assets_images_sprites_chief_airdeathexport0035_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0035.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0036.png", __ASSET__assets_images_sprites_chief_airdeathexport0036_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0036.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0037.png", __ASSET__assets_images_sprites_chief_airdeathexport0037_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0037.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0038.png", __ASSET__assets_images_sprites_chief_airdeathexport0038_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0038.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0039.png", __ASSET__assets_images_sprites_chief_airdeathexport0039_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0039.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0040.png", __ASSET__assets_images_sprites_chief_airdeathexport0040_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0040.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0041.png", __ASSET__assets_images_sprites_chief_airdeathexport0041_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0041.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0042.png", __ASSET__assets_images_sprites_chief_airdeathexport0042_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0042.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0043.png", __ASSET__assets_images_sprites_chief_airdeathexport0043_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0043.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0044.png", __ASSET__assets_images_sprites_chief_airdeathexport0044_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0044.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0045.png", __ASSET__assets_images_sprites_chief_airdeathexport0045_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0045.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/AirDeathExport0046.png", __ASSET__assets_images_sprites_chief_airdeathexport0046_png);
		type.set ("assets/images/sprites/chief/AirDeathExport0046.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0001.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0001_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0002.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0002_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0003.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0003_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0004.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0004_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0005.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0005_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0006.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0006_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0007.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0007_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0008.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0008_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0009.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0009_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0010.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0010_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0011.png", __ASSET__assets_images_sprites_chief_chief_covernoballexport0011_png);
		type.set ("assets/images/sprites/chief/Chief_CoverNoBallExport0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0001.png", __ASSET__assets_images_sprites_chief_idleexport0001_png);
		type.set ("assets/images/sprites/chief/IdleExport0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0002.png", __ASSET__assets_images_sprites_chief_idleexport0002_png);
		type.set ("assets/images/sprites/chief/IdleExport0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0003.png", __ASSET__assets_images_sprites_chief_idleexport0003_png);
		type.set ("assets/images/sprites/chief/IdleExport0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0004.png", __ASSET__assets_images_sprites_chief_idleexport0004_png);
		type.set ("assets/images/sprites/chief/IdleExport0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0005.png", __ASSET__assets_images_sprites_chief_idleexport0005_png);
		type.set ("assets/images/sprites/chief/IdleExport0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0006.png", __ASSET__assets_images_sprites_chief_idleexport0006_png);
		type.set ("assets/images/sprites/chief/IdleExport0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0007.png", __ASSET__assets_images_sprites_chief_idleexport0007_png);
		type.set ("assets/images/sprites/chief/IdleExport0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0008.png", __ASSET__assets_images_sprites_chief_idleexport0008_png);
		type.set ("assets/images/sprites/chief/IdleExport0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0009.png", __ASSET__assets_images_sprites_chief_idleexport0009_png);
		type.set ("assets/images/sprites/chief/IdleExport0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0010.png", __ASSET__assets_images_sprites_chief_idleexport0010_png);
		type.set ("assets/images/sprites/chief/IdleExport0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0011.png", __ASSET__assets_images_sprites_chief_idleexport0011_png);
		type.set ("assets/images/sprites/chief/IdleExport0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0012.png", __ASSET__assets_images_sprites_chief_idleexport0012_png);
		type.set ("assets/images/sprites/chief/IdleExport0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0013.png", __ASSET__assets_images_sprites_chief_idleexport0013_png);
		type.set ("assets/images/sprites/chief/IdleExport0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0014.png", __ASSET__assets_images_sprites_chief_idleexport0014_png);
		type.set ("assets/images/sprites/chief/IdleExport0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0015.png", __ASSET__assets_images_sprites_chief_idleexport0015_png);
		type.set ("assets/images/sprites/chief/IdleExport0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0016.png", __ASSET__assets_images_sprites_chief_idleexport0016_png);
		type.set ("assets/images/sprites/chief/IdleExport0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0017.png", __ASSET__assets_images_sprites_chief_idleexport0017_png);
		type.set ("assets/images/sprites/chief/IdleExport0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0018.png", __ASSET__assets_images_sprites_chief_idleexport0018_png);
		type.set ("assets/images/sprites/chief/IdleExport0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0019.png", __ASSET__assets_images_sprites_chief_idleexport0019_png);
		type.set ("assets/images/sprites/chief/IdleExport0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0020.png", __ASSET__assets_images_sprites_chief_idleexport0020_png);
		type.set ("assets/images/sprites/chief/IdleExport0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0021.png", __ASSET__assets_images_sprites_chief_idleexport0021_png);
		type.set ("assets/images/sprites/chief/IdleExport0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0022.png", __ASSET__assets_images_sprites_chief_idleexport0022_png);
		type.set ("assets/images/sprites/chief/IdleExport0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0023.png", __ASSET__assets_images_sprites_chief_idleexport0023_png);
		type.set ("assets/images/sprites/chief/IdleExport0023.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0024.png", __ASSET__assets_images_sprites_chief_idleexport0024_png);
		type.set ("assets/images/sprites/chief/IdleExport0024.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/IdleExport0025.png", __ASSET__assets_images_sprites_chief_idleexport0025_png);
		type.set ("assets/images/sprites/chief/IdleExport0025.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpDownExport0001.png", __ASSET__assets_images_sprites_chief_jumpdownexport0001_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpDownExport0002.png", __ASSET__assets_images_sprites_chief_jumpdownexport0002_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpDownExport0003.png", __ASSET__assets_images_sprites_chief_jumpdownexport0003_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpDownExport0004.png", __ASSET__assets_images_sprites_chief_jumpdownexport0004_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpDownExport0005.png", __ASSET__assets_images_sprites_chief_jumpdownexport0005_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpDownExport0006.png", __ASSET__assets_images_sprites_chief_jumpdownexport0006_png);
		type.set ("assets/images/sprites/chief/JumpDownExport0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpFallExport0001.png", __ASSET__assets_images_sprites_chief_jumpfallexport0001_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpFallExport0002.png", __ASSET__assets_images_sprites_chief_jumpfallexport0002_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpFallExport0003.png", __ASSET__assets_images_sprites_chief_jumpfallexport0003_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpFallExport0004.png", __ASSET__assets_images_sprites_chief_jumpfallexport0004_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpFallExport0005.png", __ASSET__assets_images_sprites_chief_jumpfallexport0005_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpFallExport0006.png", __ASSET__assets_images_sprites_chief_jumpfallexport0006_png);
		type.set ("assets/images/sprites/chief/JumpFallExport0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpUpExport0001.png", __ASSET__assets_images_sprites_chief_jumpupexport0001_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpUpExport0002.png", __ASSET__assets_images_sprites_chief_jumpupexport0002_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpUpExport0003.png", __ASSET__assets_images_sprites_chief_jumpupexport0003_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpUpExport0004.png", __ASSET__assets_images_sprites_chief_jumpupexport0004_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpUpExport0005.png", __ASSET__assets_images_sprites_chief_jumpupexport0005_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpUpExport0006.png", __ASSET__assets_images_sprites_chief_jumpupexport0006_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/JumpUpExport0007.png", __ASSET__assets_images_sprites_chief_jumpupexport0007_png);
		type.set ("assets/images/sprites/chief/JumpUpExport0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0001.png", __ASSET__assets_images_sprites_chief_run2export0001_png);
		type.set ("assets/images/sprites/chief/run2Export0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0002.png", __ASSET__assets_images_sprites_chief_run2export0002_png);
		type.set ("assets/images/sprites/chief/run2Export0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0003.png", __ASSET__assets_images_sprites_chief_run2export0003_png);
		type.set ("assets/images/sprites/chief/run2Export0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0004.png", __ASSET__assets_images_sprites_chief_run2export0004_png);
		type.set ("assets/images/sprites/chief/run2Export0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0005.png", __ASSET__assets_images_sprites_chief_run2export0005_png);
		type.set ("assets/images/sprites/chief/run2Export0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0006.png", __ASSET__assets_images_sprites_chief_run2export0006_png);
		type.set ("assets/images/sprites/chief/run2Export0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0007.png", __ASSET__assets_images_sprites_chief_run2export0007_png);
		type.set ("assets/images/sprites/chief/run2Export0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0008.png", __ASSET__assets_images_sprites_chief_run2export0008_png);
		type.set ("assets/images/sprites/chief/run2Export0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0009.png", __ASSET__assets_images_sprites_chief_run2export0009_png);
		type.set ("assets/images/sprites/chief/run2Export0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0010.png", __ASSET__assets_images_sprites_chief_run2export0010_png);
		type.set ("assets/images/sprites/chief/run2Export0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0011.png", __ASSET__assets_images_sprites_chief_run2export0011_png);
		type.set ("assets/images/sprites/chief/run2Export0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0012.png", __ASSET__assets_images_sprites_chief_run2export0012_png);
		type.set ("assets/images/sprites/chief/run2Export0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0013.png", __ASSET__assets_images_sprites_chief_run2export0013_png);
		type.set ("assets/images/sprites/chief/run2Export0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0014.png", __ASSET__assets_images_sprites_chief_run2export0014_png);
		type.set ("assets/images/sprites/chief/run2Export0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0015.png", __ASSET__assets_images_sprites_chief_run2export0015_png);
		type.set ("assets/images/sprites/chief/run2Export0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0016.png", __ASSET__assets_images_sprites_chief_run2export0016_png);
		type.set ("assets/images/sprites/chief/run2Export0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0017.png", __ASSET__assets_images_sprites_chief_run2export0017_png);
		type.set ("assets/images/sprites/chief/run2Export0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0018.png", __ASSET__assets_images_sprites_chief_run2export0018_png);
		type.set ("assets/images/sprites/chief/run2Export0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0019.png", __ASSET__assets_images_sprites_chief_run2export0019_png);
		type.set ("assets/images/sprites/chief/run2Export0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0020.png", __ASSET__assets_images_sprites_chief_run2export0020_png);
		type.set ("assets/images/sprites/chief/run2Export0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0021.png", __ASSET__assets_images_sprites_chief_run2export0021_png);
		type.set ("assets/images/sprites/chief/run2Export0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0022.png", __ASSET__assets_images_sprites_chief_run2export0022_png);
		type.set ("assets/images/sprites/chief/run2Export0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/run2Export0023.png", __ASSET__assets_images_sprites_chief_run2export0023_png);
		type.set ("assets/images/sprites/chief/run2Export0023.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0001.png", __ASSET__assets_images_sprites_chief_sword_floordown0001_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0002.png", __ASSET__assets_images_sprites_chief_sword_floordown0002_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0003.png", __ASSET__assets_images_sprites_chief_sword_floordown0003_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0004.png", __ASSET__assets_images_sprites_chief_sword_floordown0004_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0005.png", __ASSET__assets_images_sprites_chief_sword_floordown0005_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0006.png", __ASSET__assets_images_sprites_chief_sword_floordown0006_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0007.png", __ASSET__assets_images_sprites_chief_sword_floordown0007_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0008.png", __ASSET__assets_images_sprites_chief_sword_floordown0008_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0009.png", __ASSET__assets_images_sprites_chief_sword_floordown0009_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0010.png", __ASSET__assets_images_sprites_chief_sword_floordown0010_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0011.png", __ASSET__assets_images_sprites_chief_sword_floordown0011_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0012.png", __ASSET__assets_images_sprites_chief_sword_floordown0012_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0013.png", __ASSET__assets_images_sprites_chief_sword_floordown0013_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0014.png", __ASSET__assets_images_sprites_chief_sword_floordown0014_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0015.png", __ASSET__assets_images_sprites_chief_sword_floordown0015_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0016.png", __ASSET__assets_images_sprites_chief_sword_floordown0016_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0017.png", __ASSET__assets_images_sprites_chief_sword_floordown0017_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0018.png", __ASSET__assets_images_sprites_chief_sword_floordown0018_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorDown0019.png", __ASSET__assets_images_sprites_chief_sword_floordown0019_png);
		type.set ("assets/images/sprites/chief/sword_floorDown0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0001.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0001_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0002.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0002_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0003.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0003_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0004.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0004_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0005.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0005_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0006.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0006_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0007.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0007_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0008.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0008_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0009.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0009_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0010.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0010_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0011.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0011_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0012.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0012_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorSideCutExport0013.png", __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0013_png);
		type.set ("assets/images/sprites/chief/sword_floorSideCutExport0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0001.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0001_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0002.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0002_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0003.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0003_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0004.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0004_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0005.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0005_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0006.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0006_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0007.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0007_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0008.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0008_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0009.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0009_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0010.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0010_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0011.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0011_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0012.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0012_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0013.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0013_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0014.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0014_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/sword_floorUpExport0015.png", __ASSET__assets_images_sprites_chief_sword_floorupexport0015_png);
		type.set ("assets/images/sprites/chief/sword_floorUpExport0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/wallJumpOutExport0001.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0001_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/wallJumpOutExport0002.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0002_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/wallJumpOutExport0003.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0003_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/wallJumpOutExport0004.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0004_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/wallJumpOutExport0005.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0005_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/chief/wallJumpOutExport0006.png", __ASSET__assets_images_sprites_chief_walljumpoutexport0006_png);
		type.set ("assets/images/sprites/chief/wallJumpOutExport0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0001.png", __ASSET__assets_images_sprites_fx_dashcloudexport0001_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0002.png", __ASSET__assets_images_sprites_fx_dashcloudexport0002_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0003.png", __ASSET__assets_images_sprites_fx_dashcloudexport0003_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0004.png", __ASSET__assets_images_sprites_fx_dashcloudexport0004_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0005.png", __ASSET__assets_images_sprites_fx_dashcloudexport0005_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0006.png", __ASSET__assets_images_sprites_fx_dashcloudexport0006_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0007.png", __ASSET__assets_images_sprites_fx_dashcloudexport0007_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0008.png", __ASSET__assets_images_sprites_fx_dashcloudexport0008_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0009.png", __ASSET__assets_images_sprites_fx_dashcloudexport0009_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0010.png", __ASSET__assets_images_sprites_fx_dashcloudexport0010_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/dashCloudEXPORT0011.png", __ASSET__assets_images_sprites_fx_dashcloudexport0011_png);
		type.set ("assets/images/sprites/FX/dashCloudEXPORT0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0001.png", __ASSET__assets_images_sprites_fx_dashfloor1export0001_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0002.png", __ASSET__assets_images_sprites_fx_dashfloor1export0002_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0003.png", __ASSET__assets_images_sprites_fx_dashfloor1export0003_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0004.png", __ASSET__assets_images_sprites_fx_dashfloor1export0004_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0005.png", __ASSET__assets_images_sprites_fx_dashfloor1export0005_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0006.png", __ASSET__assets_images_sprites_fx_dashfloor1export0006_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0007.png", __ASSET__assets_images_sprites_fx_dashfloor1export0007_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/DashFloor1EXPORT0008.png", __ASSET__assets_images_sprites_fx_dashfloor1export0008_png);
		type.set ("assets/images/sprites/FX/DashFloor1EXPORT0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/DashGunTrailEXPORT.png", __ASSET__assets_images_sprites_fx_dashguntrailexport_png);
		type.set ("assets/images/sprites/FX/DashGunTrailEXPORT.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/DashTrailExport.png", __ASSET__assets_images_sprites_fx_dashtrailexport_png);
		type.set ("assets/images/sprites/FX/DashTrailExport.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0001.png", __ASSET__assets_images_sprites_fx_floorfall_0001_png);
		type.set ("assets/images/sprites/FX/floorFall_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0002.png", __ASSET__assets_images_sprites_fx_floorfall_0002_png);
		type.set ("assets/images/sprites/FX/floorFall_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0003.png", __ASSET__assets_images_sprites_fx_floorfall_0003_png);
		type.set ("assets/images/sprites/FX/floorFall_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0004.png", __ASSET__assets_images_sprites_fx_floorfall_0004_png);
		type.set ("assets/images/sprites/FX/floorFall_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0005.png", __ASSET__assets_images_sprites_fx_floorfall_0005_png);
		type.set ("assets/images/sprites/FX/floorFall_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0006.png", __ASSET__assets_images_sprites_fx_floorfall_0006_png);
		type.set ("assets/images/sprites/FX/floorFall_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0007.png", __ASSET__assets_images_sprites_fx_floorfall_0007_png);
		type.set ("assets/images/sprites/FX/floorFall_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0008.png", __ASSET__assets_images_sprites_fx_floorfall_0008_png);
		type.set ("assets/images/sprites/FX/floorFall_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0009.png", __ASSET__assets_images_sprites_fx_floorfall_0009_png);
		type.set ("assets/images/sprites/FX/floorFall_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0010.png", __ASSET__assets_images_sprites_fx_floorfall_0010_png);
		type.set ("assets/images/sprites/FX/floorFall_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0011.png", __ASSET__assets_images_sprites_fx_floorfall_0011_png);
		type.set ("assets/images/sprites/FX/floorFall_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0012.png", __ASSET__assets_images_sprites_fx_floorfall_0012_png);
		type.set ("assets/images/sprites/FX/floorFall_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0013.png", __ASSET__assets_images_sprites_fx_floorfall_0013_png);
		type.set ("assets/images/sprites/FX/floorFall_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0014.png", __ASSET__assets_images_sprites_fx_floorfall_0014_png);
		type.set ("assets/images/sprites/FX/floorFall_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0015.png", __ASSET__assets_images_sprites_fx_floorfall_0015_png);
		type.set ("assets/images/sprites/FX/floorFall_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0016.png", __ASSET__assets_images_sprites_fx_floorfall_0016_png);
		type.set ("assets/images/sprites/FX/floorFall_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0017.png", __ASSET__assets_images_sprites_fx_floorfall_0017_png);
		type.set ("assets/images/sprites/FX/floorFall_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0018.png", __ASSET__assets_images_sprites_fx_floorfall_0018_png);
		type.set ("assets/images/sprites/FX/floorFall_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0019.png", __ASSET__assets_images_sprites_fx_floorfall_0019_png);
		type.set ("assets/images/sprites/FX/floorFall_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0020.png", __ASSET__assets_images_sprites_fx_floorfall_0020_png);
		type.set ("assets/images/sprites/FX/floorFall_0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0021.png", __ASSET__assets_images_sprites_fx_floorfall_0021_png);
		type.set ("assets/images/sprites/FX/floorFall_0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_0022.png", __ASSET__assets_images_sprites_fx_floorfall_0022_png);
		type.set ("assets/images/sprites/FX/floorFall_0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0001.png", __ASSET__assets_images_sprites_fx_floorfall_2_0001_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0002.png", __ASSET__assets_images_sprites_fx_floorfall_2_0002_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0003.png", __ASSET__assets_images_sprites_fx_floorfall_2_0003_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0004.png", __ASSET__assets_images_sprites_fx_floorfall_2_0004_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0005.png", __ASSET__assets_images_sprites_fx_floorfall_2_0005_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0006.png", __ASSET__assets_images_sprites_fx_floorfall_2_0006_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0007.png", __ASSET__assets_images_sprites_fx_floorfall_2_0007_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0008.png", __ASSET__assets_images_sprites_fx_floorfall_2_0008_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0009.png", __ASSET__assets_images_sprites_fx_floorfall_2_0009_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0010.png", __ASSET__assets_images_sprites_fx_floorfall_2_0010_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0011.png", __ASSET__assets_images_sprites_fx_floorfall_2_0011_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0012.png", __ASSET__assets_images_sprites_fx_floorfall_2_0012_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0013.png", __ASSET__assets_images_sprites_fx_floorfall_2_0013_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0014.png", __ASSET__assets_images_sprites_fx_floorfall_2_0014_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0015.png", __ASSET__assets_images_sprites_fx_floorfall_2_0015_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0016.png", __ASSET__assets_images_sprites_fx_floorfall_2_0016_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0017.png", __ASSET__assets_images_sprites_fx_floorfall_2_0017_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0018.png", __ASSET__assets_images_sprites_fx_floorfall_2_0018_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0019.png", __ASSET__assets_images_sprites_fx_floorfall_2_0019_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0020.png", __ASSET__assets_images_sprites_fx_floorfall_2_0020_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0021.png", __ASSET__assets_images_sprites_fx_floorfall_2_0021_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0022.png", __ASSET__assets_images_sprites_fx_floorfall_2_0022_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0023.png", __ASSET__assets_images_sprites_fx_floorfall_2_0023_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0023.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorFall_2_0024.png", __ASSET__assets_images_sprites_fx_floorfall_2_0024_png);
		type.set ("assets/images/sprites/FX/floorFall_2_0024.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0001.png", __ASSET__assets_images_sprites_fx_floorjump1_0001_png);
		type.set ("assets/images/sprites/FX/floorJump1_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0002.png", __ASSET__assets_images_sprites_fx_floorjump1_0002_png);
		type.set ("assets/images/sprites/FX/floorJump1_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0003.png", __ASSET__assets_images_sprites_fx_floorjump1_0003_png);
		type.set ("assets/images/sprites/FX/floorJump1_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0004.png", __ASSET__assets_images_sprites_fx_floorjump1_0004_png);
		type.set ("assets/images/sprites/FX/floorJump1_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0005.png", __ASSET__assets_images_sprites_fx_floorjump1_0005_png);
		type.set ("assets/images/sprites/FX/floorJump1_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0006.png", __ASSET__assets_images_sprites_fx_floorjump1_0006_png);
		type.set ("assets/images/sprites/FX/floorJump1_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0007.png", __ASSET__assets_images_sprites_fx_floorjump1_0007_png);
		type.set ("assets/images/sprites/FX/floorJump1_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0008.png", __ASSET__assets_images_sprites_fx_floorjump1_0008_png);
		type.set ("assets/images/sprites/FX/floorJump1_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0009.png", __ASSET__assets_images_sprites_fx_floorjump1_0009_png);
		type.set ("assets/images/sprites/FX/floorJump1_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0010.png", __ASSET__assets_images_sprites_fx_floorjump1_0010_png);
		type.set ("assets/images/sprites/FX/floorJump1_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0011.png", __ASSET__assets_images_sprites_fx_floorjump1_0011_png);
		type.set ("assets/images/sprites/FX/floorJump1_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0012.png", __ASSET__assets_images_sprites_fx_floorjump1_0012_png);
		type.set ("assets/images/sprites/FX/floorJump1_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0013.png", __ASSET__assets_images_sprites_fx_floorjump1_0013_png);
		type.set ("assets/images/sprites/FX/floorJump1_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0014.png", __ASSET__assets_images_sprites_fx_floorjump1_0014_png);
		type.set ("assets/images/sprites/FX/floorJump1_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0015.png", __ASSET__assets_images_sprites_fx_floorjump1_0015_png);
		type.set ("assets/images/sprites/FX/floorJump1_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0016.png", __ASSET__assets_images_sprites_fx_floorjump1_0016_png);
		type.set ("assets/images/sprites/FX/floorJump1_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0017.png", __ASSET__assets_images_sprites_fx_floorjump1_0017_png);
		type.set ("assets/images/sprites/FX/floorJump1_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0018.png", __ASSET__assets_images_sprites_fx_floorjump1_0018_png);
		type.set ("assets/images/sprites/FX/floorJump1_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0019.png", __ASSET__assets_images_sprites_fx_floorjump1_0019_png);
		type.set ("assets/images/sprites/FX/floorJump1_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0020.png", __ASSET__assets_images_sprites_fx_floorjump1_0020_png);
		type.set ("assets/images/sprites/FX/floorJump1_0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0021.png", __ASSET__assets_images_sprites_fx_floorjump1_0021_png);
		type.set ("assets/images/sprites/FX/floorJump1_0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0022.png", __ASSET__assets_images_sprites_fx_floorjump1_0022_png);
		type.set ("assets/images/sprites/FX/floorJump1_0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0023.png", __ASSET__assets_images_sprites_fx_floorjump1_0023_png);
		type.set ("assets/images/sprites/FX/floorJump1_0023.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump1_0024.png", __ASSET__assets_images_sprites_fx_floorjump1_0024_png);
		type.set ("assets/images/sprites/FX/floorJump1_0024.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0001.png", __ASSET__assets_images_sprites_fx_floorjump2_0001_png);
		type.set ("assets/images/sprites/FX/floorJump2_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0002.png", __ASSET__assets_images_sprites_fx_floorjump2_0002_png);
		type.set ("assets/images/sprites/FX/floorJump2_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0003.png", __ASSET__assets_images_sprites_fx_floorjump2_0003_png);
		type.set ("assets/images/sprites/FX/floorJump2_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0004.png", __ASSET__assets_images_sprites_fx_floorjump2_0004_png);
		type.set ("assets/images/sprites/FX/floorJump2_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0005.png", __ASSET__assets_images_sprites_fx_floorjump2_0005_png);
		type.set ("assets/images/sprites/FX/floorJump2_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0006.png", __ASSET__assets_images_sprites_fx_floorjump2_0006_png);
		type.set ("assets/images/sprites/FX/floorJump2_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0007.png", __ASSET__assets_images_sprites_fx_floorjump2_0007_png);
		type.set ("assets/images/sprites/FX/floorJump2_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0008.png", __ASSET__assets_images_sprites_fx_floorjump2_0008_png);
		type.set ("assets/images/sprites/FX/floorJump2_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0009.png", __ASSET__assets_images_sprites_fx_floorjump2_0009_png);
		type.set ("assets/images/sprites/FX/floorJump2_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0010.png", __ASSET__assets_images_sprites_fx_floorjump2_0010_png);
		type.set ("assets/images/sprites/FX/floorJump2_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0011.png", __ASSET__assets_images_sprites_fx_floorjump2_0011_png);
		type.set ("assets/images/sprites/FX/floorJump2_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0012.png", __ASSET__assets_images_sprites_fx_floorjump2_0012_png);
		type.set ("assets/images/sprites/FX/floorJump2_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0013.png", __ASSET__assets_images_sprites_fx_floorjump2_0013_png);
		type.set ("assets/images/sprites/FX/floorJump2_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0014.png", __ASSET__assets_images_sprites_fx_floorjump2_0014_png);
		type.set ("assets/images/sprites/FX/floorJump2_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0015.png", __ASSET__assets_images_sprites_fx_floorjump2_0015_png);
		type.set ("assets/images/sprites/FX/floorJump2_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0016.png", __ASSET__assets_images_sprites_fx_floorjump2_0016_png);
		type.set ("assets/images/sprites/FX/floorJump2_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0017.png", __ASSET__assets_images_sprites_fx_floorjump2_0017_png);
		type.set ("assets/images/sprites/FX/floorJump2_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0018.png", __ASSET__assets_images_sprites_fx_floorjump2_0018_png);
		type.set ("assets/images/sprites/FX/floorJump2_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/floorJump2_0019.png", __ASSET__assets_images_sprites_fx_floorjump2_0019_png);
		type.set ("assets/images/sprites/FX/floorJump2_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0001.png", __ASSET__assets_images_sprites_fx_fx_run_0001_png);
		type.set ("assets/images/sprites/FX/fx_run_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0002.png", __ASSET__assets_images_sprites_fx_fx_run_0002_png);
		type.set ("assets/images/sprites/FX/fx_run_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0003.png", __ASSET__assets_images_sprites_fx_fx_run_0003_png);
		type.set ("assets/images/sprites/FX/fx_run_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0004.png", __ASSET__assets_images_sprites_fx_fx_run_0004_png);
		type.set ("assets/images/sprites/FX/fx_run_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0005.png", __ASSET__assets_images_sprites_fx_fx_run_0005_png);
		type.set ("assets/images/sprites/FX/fx_run_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0006.png", __ASSET__assets_images_sprites_fx_fx_run_0006_png);
		type.set ("assets/images/sprites/FX/fx_run_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0007.png", __ASSET__assets_images_sprites_fx_fx_run_0007_png);
		type.set ("assets/images/sprites/FX/fx_run_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0008.png", __ASSET__assets_images_sprites_fx_fx_run_0008_png);
		type.set ("assets/images/sprites/FX/fx_run_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0009.png", __ASSET__assets_images_sprites_fx_fx_run_0009_png);
		type.set ("assets/images/sprites/FX/fx_run_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0010.png", __ASSET__assets_images_sprites_fx_fx_run_0010_png);
		type.set ("assets/images/sprites/FX/fx_run_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0011.png", __ASSET__assets_images_sprites_fx_fx_run_0011_png);
		type.set ("assets/images/sprites/FX/fx_run_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0012.png", __ASSET__assets_images_sprites_fx_fx_run_0012_png);
		type.set ("assets/images/sprites/FX/fx_run_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0013.png", __ASSET__assets_images_sprites_fx_fx_run_0013_png);
		type.set ("assets/images/sprites/FX/fx_run_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/fx_run_0014.png", __ASSET__assets_images_sprites_fx_fx_run_0014_png);
		type.set ("assets/images/sprites/FX/fx_run_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0001.png", __ASSET__assets_images_sprites_fx_swordhit0001_png);
		type.set ("assets/images/sprites/FX/swordHit0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0002.png", __ASSET__assets_images_sprites_fx_swordhit0002_png);
		type.set ("assets/images/sprites/FX/swordHit0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0003.png", __ASSET__assets_images_sprites_fx_swordhit0003_png);
		type.set ("assets/images/sprites/FX/swordHit0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0004.png", __ASSET__assets_images_sprites_fx_swordhit0004_png);
		type.set ("assets/images/sprites/FX/swordHit0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0005.png", __ASSET__assets_images_sprites_fx_swordhit0005_png);
		type.set ("assets/images/sprites/FX/swordHit0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0006.png", __ASSET__assets_images_sprites_fx_swordhit0006_png);
		type.set ("assets/images/sprites/FX/swordHit0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0007.png", __ASSET__assets_images_sprites_fx_swordhit0007_png);
		type.set ("assets/images/sprites/FX/swordHit0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0008.png", __ASSET__assets_images_sprites_fx_swordhit0008_png);
		type.set ("assets/images/sprites/FX/swordHit0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0009.png", __ASSET__assets_images_sprites_fx_swordhit0009_png);
		type.set ("assets/images/sprites/FX/swordHit0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0010.png", __ASSET__assets_images_sprites_fx_swordhit0010_png);
		type.set ("assets/images/sprites/FX/swordHit0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/swordHit0011.png", __ASSET__assets_images_sprites_fx_swordhit0011_png);
		type.set ("assets/images/sprites/FX/swordHit0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0001.png", __ASSET__assets_images_sprites_fx_wallloop_0001_png);
		type.set ("assets/images/sprites/FX/wallLoop_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0002.png", __ASSET__assets_images_sprites_fx_wallloop_0002_png);
		type.set ("assets/images/sprites/FX/wallLoop_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0003.png", __ASSET__assets_images_sprites_fx_wallloop_0003_png);
		type.set ("assets/images/sprites/FX/wallLoop_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0004.png", __ASSET__assets_images_sprites_fx_wallloop_0004_png);
		type.set ("assets/images/sprites/FX/wallLoop_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0005.png", __ASSET__assets_images_sprites_fx_wallloop_0005_png);
		type.set ("assets/images/sprites/FX/wallLoop_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0006.png", __ASSET__assets_images_sprites_fx_wallloop_0006_png);
		type.set ("assets/images/sprites/FX/wallLoop_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0007.png", __ASSET__assets_images_sprites_fx_wallloop_0007_png);
		type.set ("assets/images/sprites/FX/wallLoop_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0008.png", __ASSET__assets_images_sprites_fx_wallloop_0008_png);
		type.set ("assets/images/sprites/FX/wallLoop_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0009.png", __ASSET__assets_images_sprites_fx_wallloop_0009_png);
		type.set ("assets/images/sprites/FX/wallLoop_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0010.png", __ASSET__assets_images_sprites_fx_wallloop_0010_png);
		type.set ("assets/images/sprites/FX/wallLoop_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0011.png", __ASSET__assets_images_sprites_fx_wallloop_0011_png);
		type.set ("assets/images/sprites/FX/wallLoop_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0012.png", __ASSET__assets_images_sprites_fx_wallloop_0012_png);
		type.set ("assets/images/sprites/FX/wallLoop_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0013.png", __ASSET__assets_images_sprites_fx_wallloop_0013_png);
		type.set ("assets/images/sprites/FX/wallLoop_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0014.png", __ASSET__assets_images_sprites_fx_wallloop_0014_png);
		type.set ("assets/images/sprites/FX/wallLoop_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0015.png", __ASSET__assets_images_sprites_fx_wallloop_0015_png);
		type.set ("assets/images/sprites/FX/wallLoop_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0016.png", __ASSET__assets_images_sprites_fx_wallloop_0016_png);
		type.set ("assets/images/sprites/FX/wallLoop_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0017.png", __ASSET__assets_images_sprites_fx_wallloop_0017_png);
		type.set ("assets/images/sprites/FX/wallLoop_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0018.png", __ASSET__assets_images_sprites_fx_wallloop_0018_png);
		type.set ("assets/images/sprites/FX/wallLoop_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0019.png", __ASSET__assets_images_sprites_fx_wallloop_0019_png);
		type.set ("assets/images/sprites/FX/wallLoop_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/FX/wallLoop_0020.png", __ASSET__assets_images_sprites_fx_wallloop_0020_png);
		type.set ("assets/images/sprites/FX/wallLoop_0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png", __ASSET__assets_images_sprites_punk__punk_attack_floorside_0001removed_png);
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png", __ASSET__assets_images_sprites_punk__punk_attack_floorside_0015removed_png);
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png", __ASSET__assets_images_sprites_punk__punk_attack_floorside_0016removed_png);
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png", __ASSET__assets_images_sprites_punk__punk_attack_floorside_0017removed_png);
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png", __ASSET__assets_images_sprites_punk__punk_attack_floorside_0018removed_png);
		type.set ("assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0001.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0001_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0002.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0002_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0003.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0003_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0004.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0004_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0005.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0005_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0006.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0006_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0007.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0007_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0008.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0008_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0009.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0009_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0010.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0010_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0011.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0011_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0012.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0012_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0013.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0013_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0014.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0014_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0015.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0015_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0016.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0016_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0017.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0017_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0018.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0018_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorDown_0019.png", __ASSET__assets_images_sprites_punk_punk_attack_floordown_0019_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorDown_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0002.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0002_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0003.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0003_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0004.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0004_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0005.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0005_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0006.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0006_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0007.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0007_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0008.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0008_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0009.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0009_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0010.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0010_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0011.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0011_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0012.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0012_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0013.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0013_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorSide_0014.png", __ASSET__assets_images_sprites_punk_punk_attack_floorside_0014_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorSide_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0001.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0001_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0002.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0002_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0003.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0003_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0004.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0004_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0005.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0005_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0006.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0006_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0007.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0007_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0008.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0008_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0009.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0009_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0010.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0010_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0011.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0011_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0012.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0012_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0013.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0013_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0014.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0014_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_attack_floorUp_0015.png", __ASSET__assets_images_sprites_punk_punk_attack_floorup_0015_png);
		type.set ("assets/images/sprites/punk/punk_attack_floorUp_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_dash_.png", __ASSET__assets_images_sprites_punk_punk_dash__png);
		type.set ("assets/images/sprites/punk/punk_dash_.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0001.png", __ASSET__assets_images_sprites_punk_punk_death_0001_png);
		type.set ("assets/images/sprites/punk/punk_death_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0002.png", __ASSET__assets_images_sprites_punk_punk_death_0002_png);
		type.set ("assets/images/sprites/punk/punk_death_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0003.png", __ASSET__assets_images_sprites_punk_punk_death_0003_png);
		type.set ("assets/images/sprites/punk/punk_death_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0004.png", __ASSET__assets_images_sprites_punk_punk_death_0004_png);
		type.set ("assets/images/sprites/punk/punk_death_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0005.png", __ASSET__assets_images_sprites_punk_punk_death_0005_png);
		type.set ("assets/images/sprites/punk/punk_death_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0006.png", __ASSET__assets_images_sprites_punk_punk_death_0006_png);
		type.set ("assets/images/sprites/punk/punk_death_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0007.png", __ASSET__assets_images_sprites_punk_punk_death_0007_png);
		type.set ("assets/images/sprites/punk/punk_death_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0008.png", __ASSET__assets_images_sprites_punk_punk_death_0008_png);
		type.set ("assets/images/sprites/punk/punk_death_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0009.png", __ASSET__assets_images_sprites_punk_punk_death_0009_png);
		type.set ("assets/images/sprites/punk/punk_death_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0010.png", __ASSET__assets_images_sprites_punk_punk_death_0010_png);
		type.set ("assets/images/sprites/punk/punk_death_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0011.png", __ASSET__assets_images_sprites_punk_punk_death_0011_png);
		type.set ("assets/images/sprites/punk/punk_death_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0012.png", __ASSET__assets_images_sprites_punk_punk_death_0012_png);
		type.set ("assets/images/sprites/punk/punk_death_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0013.png", __ASSET__assets_images_sprites_punk_punk_death_0013_png);
		type.set ("assets/images/sprites/punk/punk_death_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0014.png", __ASSET__assets_images_sprites_punk_punk_death_0014_png);
		type.set ("assets/images/sprites/punk/punk_death_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0015.png", __ASSET__assets_images_sprites_punk_punk_death_0015_png);
		type.set ("assets/images/sprites/punk/punk_death_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0016.png", __ASSET__assets_images_sprites_punk_punk_death_0016_png);
		type.set ("assets/images/sprites/punk/punk_death_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0017.png", __ASSET__assets_images_sprites_punk_punk_death_0017_png);
		type.set ("assets/images/sprites/punk/punk_death_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0018.png", __ASSET__assets_images_sprites_punk_punk_death_0018_png);
		type.set ("assets/images/sprites/punk/punk_death_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0019.png", __ASSET__assets_images_sprites_punk_punk_death_0019_png);
		type.set ("assets/images/sprites/punk/punk_death_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0020.png", __ASSET__assets_images_sprites_punk_punk_death_0020_png);
		type.set ("assets/images/sprites/punk/punk_death_0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0021.png", __ASSET__assets_images_sprites_punk_punk_death_0021_png);
		type.set ("assets/images/sprites/punk/punk_death_0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0022.png", __ASSET__assets_images_sprites_punk_punk_death_0022_png);
		type.set ("assets/images/sprites/punk/punk_death_0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0023.png", __ASSET__assets_images_sprites_punk_punk_death_0023_png);
		type.set ("assets/images/sprites/punk/punk_death_0023.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0024.png", __ASSET__assets_images_sprites_punk_punk_death_0024_png);
		type.set ("assets/images/sprites/punk/punk_death_0024.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0025.png", __ASSET__assets_images_sprites_punk_punk_death_0025_png);
		type.set ("assets/images/sprites/punk/punk_death_0025.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0026.png", __ASSET__assets_images_sprites_punk_punk_death_0026_png);
		type.set ("assets/images/sprites/punk/punk_death_0026.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0027.png", __ASSET__assets_images_sprites_punk_punk_death_0027_png);
		type.set ("assets/images/sprites/punk/punk_death_0027.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0028.png", __ASSET__assets_images_sprites_punk_punk_death_0028_png);
		type.set ("assets/images/sprites/punk/punk_death_0028.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0029.png", __ASSET__assets_images_sprites_punk_punk_death_0029_png);
		type.set ("assets/images/sprites/punk/punk_death_0029.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0030.png", __ASSET__assets_images_sprites_punk_punk_death_0030_png);
		type.set ("assets/images/sprites/punk/punk_death_0030.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0031.png", __ASSET__assets_images_sprites_punk_punk_death_0031_png);
		type.set ("assets/images/sprites/punk/punk_death_0031.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0032.png", __ASSET__assets_images_sprites_punk_punk_death_0032_png);
		type.set ("assets/images/sprites/punk/punk_death_0032.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0033.png", __ASSET__assets_images_sprites_punk_punk_death_0033_png);
		type.set ("assets/images/sprites/punk/punk_death_0033.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0034.png", __ASSET__assets_images_sprites_punk_punk_death_0034_png);
		type.set ("assets/images/sprites/punk/punk_death_0034.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0035.png", __ASSET__assets_images_sprites_punk_punk_death_0035_png);
		type.set ("assets/images/sprites/punk/punk_death_0035.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0036.png", __ASSET__assets_images_sprites_punk_punk_death_0036_png);
		type.set ("assets/images/sprites/punk/punk_death_0036.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0037.png", __ASSET__assets_images_sprites_punk_punk_death_0037_png);
		type.set ("assets/images/sprites/punk/punk_death_0037.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0038.png", __ASSET__assets_images_sprites_punk_punk_death_0038_png);
		type.set ("assets/images/sprites/punk/punk_death_0038.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0039.png", __ASSET__assets_images_sprites_punk_punk_death_0039_png);
		type.set ("assets/images/sprites/punk/punk_death_0039.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0040.png", __ASSET__assets_images_sprites_punk_punk_death_0040_png);
		type.set ("assets/images/sprites/punk/punk_death_0040.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0041.png", __ASSET__assets_images_sprites_punk_punk_death_0041_png);
		type.set ("assets/images/sprites/punk/punk_death_0041.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0042.png", __ASSET__assets_images_sprites_punk_punk_death_0042_png);
		type.set ("assets/images/sprites/punk/punk_death_0042.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0043.png", __ASSET__assets_images_sprites_punk_punk_death_0043_png);
		type.set ("assets/images/sprites/punk/punk_death_0043.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0044.png", __ASSET__assets_images_sprites_punk_punk_death_0044_png);
		type.set ("assets/images/sprites/punk/punk_death_0044.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0045.png", __ASSET__assets_images_sprites_punk_punk_death_0045_png);
		type.set ("assets/images/sprites/punk/punk_death_0045.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_death_0046.png", __ASSET__assets_images_sprites_punk_punk_death_0046_png);
		type.set ("assets/images/sprites/punk/punk_death_0046.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0001.png", __ASSET__assets_images_sprites_punk_punk_idle_0001_png);
		type.set ("assets/images/sprites/punk/punk_idle_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0002.png", __ASSET__assets_images_sprites_punk_punk_idle_0002_png);
		type.set ("assets/images/sprites/punk/punk_idle_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0003.png", __ASSET__assets_images_sprites_punk_punk_idle_0003_png);
		type.set ("assets/images/sprites/punk/punk_idle_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0004.png", __ASSET__assets_images_sprites_punk_punk_idle_0004_png);
		type.set ("assets/images/sprites/punk/punk_idle_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0005.png", __ASSET__assets_images_sprites_punk_punk_idle_0005_png);
		type.set ("assets/images/sprites/punk/punk_idle_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0006.png", __ASSET__assets_images_sprites_punk_punk_idle_0006_png);
		type.set ("assets/images/sprites/punk/punk_idle_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0007.png", __ASSET__assets_images_sprites_punk_punk_idle_0007_png);
		type.set ("assets/images/sprites/punk/punk_idle_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0008.png", __ASSET__assets_images_sprites_punk_punk_idle_0008_png);
		type.set ("assets/images/sprites/punk/punk_idle_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0009.png", __ASSET__assets_images_sprites_punk_punk_idle_0009_png);
		type.set ("assets/images/sprites/punk/punk_idle_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0010.png", __ASSET__assets_images_sprites_punk_punk_idle_0010_png);
		type.set ("assets/images/sprites/punk/punk_idle_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0011.png", __ASSET__assets_images_sprites_punk_punk_idle_0011_png);
		type.set ("assets/images/sprites/punk/punk_idle_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0012.png", __ASSET__assets_images_sprites_punk_punk_idle_0012_png);
		type.set ("assets/images/sprites/punk/punk_idle_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0013.png", __ASSET__assets_images_sprites_punk_punk_idle_0013_png);
		type.set ("assets/images/sprites/punk/punk_idle_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0014.png", __ASSET__assets_images_sprites_punk_punk_idle_0014_png);
		type.set ("assets/images/sprites/punk/punk_idle_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0015.png", __ASSET__assets_images_sprites_punk_punk_idle_0015_png);
		type.set ("assets/images/sprites/punk/punk_idle_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0016.png", __ASSET__assets_images_sprites_punk_punk_idle_0016_png);
		type.set ("assets/images/sprites/punk/punk_idle_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0017.png", __ASSET__assets_images_sprites_punk_punk_idle_0017_png);
		type.set ("assets/images/sprites/punk/punk_idle_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0018.png", __ASSET__assets_images_sprites_punk_punk_idle_0018_png);
		type.set ("assets/images/sprites/punk/punk_idle_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0019.png", __ASSET__assets_images_sprites_punk_punk_idle_0019_png);
		type.set ("assets/images/sprites/punk/punk_idle_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0020.png", __ASSET__assets_images_sprites_punk_punk_idle_0020_png);
		type.set ("assets/images/sprites/punk/punk_idle_0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0021.png", __ASSET__assets_images_sprites_punk_punk_idle_0021_png);
		type.set ("assets/images/sprites/punk/punk_idle_0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0022.png", __ASSET__assets_images_sprites_punk_punk_idle_0022_png);
		type.set ("assets/images/sprites/punk/punk_idle_0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0023.png", __ASSET__assets_images_sprites_punk_punk_idle_0023_png);
		type.set ("assets/images/sprites/punk/punk_idle_0023.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0024.png", __ASSET__assets_images_sprites_punk_punk_idle_0024_png);
		type.set ("assets/images/sprites/punk/punk_idle_0024.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_idle_0025.png", __ASSET__assets_images_sprites_punk_punk_idle_0025_png);
		type.set ("assets/images/sprites/punk/punk_idle_0025.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_jumpDown_0001.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0001_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_jumpDown_0002.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0002_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_jumpDown_0003.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0003_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_jumpDown_0004.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0004_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_jumpDown_0005.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0005_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_jumpDown_0006.png", __ASSET__assets_images_sprites_punk_punk_jumpdown_0006_png);
		type.set ("assets/images/sprites/punk/punk_jumpDown_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/punk_walljump_0001.png", __ASSET__assets_images_sprites_punk_punk_walljump_0001_png);
		type.set ("assets/images/sprites/punk/punk_walljump_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0001.png", __ASSET__assets_images_sprites_punk_runpunk_0001_png);
		type.set ("assets/images/sprites/punk/runPunk_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0002.png", __ASSET__assets_images_sprites_punk_runpunk_0002_png);
		type.set ("assets/images/sprites/punk/runPunk_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0003.png", __ASSET__assets_images_sprites_punk_runpunk_0003_png);
		type.set ("assets/images/sprites/punk/runPunk_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0004.png", __ASSET__assets_images_sprites_punk_runpunk_0004_png);
		type.set ("assets/images/sprites/punk/runPunk_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0005.png", __ASSET__assets_images_sprites_punk_runpunk_0005_png);
		type.set ("assets/images/sprites/punk/runPunk_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0006.png", __ASSET__assets_images_sprites_punk_runpunk_0006_png);
		type.set ("assets/images/sprites/punk/runPunk_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0007.png", __ASSET__assets_images_sprites_punk_runpunk_0007_png);
		type.set ("assets/images/sprites/punk/runPunk_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0008.png", __ASSET__assets_images_sprites_punk_runpunk_0008_png);
		type.set ("assets/images/sprites/punk/runPunk_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0009.png", __ASSET__assets_images_sprites_punk_runpunk_0009_png);
		type.set ("assets/images/sprites/punk/runPunk_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0010.png", __ASSET__assets_images_sprites_punk_runpunk_0010_png);
		type.set ("assets/images/sprites/punk/runPunk_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0011.png", __ASSET__assets_images_sprites_punk_runpunk_0011_png);
		type.set ("assets/images/sprites/punk/runPunk_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0012.png", __ASSET__assets_images_sprites_punk_runpunk_0012_png);
		type.set ("assets/images/sprites/punk/runPunk_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0013.png", __ASSET__assets_images_sprites_punk_runpunk_0013_png);
		type.set ("assets/images/sprites/punk/runPunk_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0014.png", __ASSET__assets_images_sprites_punk_runpunk_0014_png);
		type.set ("assets/images/sprites/punk/runPunk_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0015.png", __ASSET__assets_images_sprites_punk_runpunk_0015_png);
		type.set ("assets/images/sprites/punk/runPunk_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0016.png", __ASSET__assets_images_sprites_punk_runpunk_0016_png);
		type.set ("assets/images/sprites/punk/runPunk_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0017.png", __ASSET__assets_images_sprites_punk_runpunk_0017_png);
		type.set ("assets/images/sprites/punk/runPunk_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0018.png", __ASSET__assets_images_sprites_punk_runpunk_0018_png);
		type.set ("assets/images/sprites/punk/runPunk_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0019.png", __ASSET__assets_images_sprites_punk_runpunk_0019_png);
		type.set ("assets/images/sprites/punk/runPunk_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0020.png", __ASSET__assets_images_sprites_punk_runpunk_0020_png);
		type.set ("assets/images/sprites/punk/runPunk_0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0021.png", __ASSET__assets_images_sprites_punk_runpunk_0021_png);
		type.set ("assets/images/sprites/punk/runPunk_0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0022.png", __ASSET__assets_images_sprites_punk_runpunk_0022_png);
		type.set ("assets/images/sprites/punk/runPunk_0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0023.png", __ASSET__assets_images_sprites_punk_runpunk_0023_png);
		type.set ("assets/images/sprites/punk/runPunk_0023.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/punk/runPunk_0024.png", __ASSET__assets_images_sprites_punk_runpunk_0024_png);
		type.set ("assets/images/sprites/punk/runPunk_0024.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/bombo_big_load_0001.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0001_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/bombo_big_load_0002.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0002_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/bombo_big_load_0003.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0003_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/bombo_big_load_0004.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0004_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/bombo_big_load_0005.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0005_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/bombo_big_load_0006.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0006_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/bombo_big_load_0007.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0007_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/bombo_big_load_0008.png", __ASSET__assets_images_sprites_pups_bombo_big_load_0008_png);
		type.set ("assets/images/sprites/pUps/bombo_big_load_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/bomb_big_white_0001.png", __ASSET__assets_images_sprites_pups_bomb_big_white_0001_png);
		type.set ("assets/images/sprites/pUps/bomb_big_white_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/bomb_big_white_0002.png", __ASSET__assets_images_sprites_pups_bomb_big_white_0002_png);
		type.set ("assets/images/sprites/pUps/bomb_big_white_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/Crate.png", __ASSET__assets_images_sprites_pups_crate_png);
		type.set ("assets/images/sprites/pUps/Crate.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0001.png", __ASSET__assets_images_sprites_pups_explosion_0001_png);
		type.set ("assets/images/sprites/pUps/explosion_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0002.png", __ASSET__assets_images_sprites_pups_explosion_0002_png);
		type.set ("assets/images/sprites/pUps/explosion_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0003.png", __ASSET__assets_images_sprites_pups_explosion_0003_png);
		type.set ("assets/images/sprites/pUps/explosion_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0004.png", __ASSET__assets_images_sprites_pups_explosion_0004_png);
		type.set ("assets/images/sprites/pUps/explosion_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0005.png", __ASSET__assets_images_sprites_pups_explosion_0005_png);
		type.set ("assets/images/sprites/pUps/explosion_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0006.png", __ASSET__assets_images_sprites_pups_explosion_0006_png);
		type.set ("assets/images/sprites/pUps/explosion_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0007.png", __ASSET__assets_images_sprites_pups_explosion_0007_png);
		type.set ("assets/images/sprites/pUps/explosion_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0008.png", __ASSET__assets_images_sprites_pups_explosion_0008_png);
		type.set ("assets/images/sprites/pUps/explosion_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0009.png", __ASSET__assets_images_sprites_pups_explosion_0009_png);
		type.set ("assets/images/sprites/pUps/explosion_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0010.png", __ASSET__assets_images_sprites_pups_explosion_0010_png);
		type.set ("assets/images/sprites/pUps/explosion_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0011.png", __ASSET__assets_images_sprites_pups_explosion_0011_png);
		type.set ("assets/images/sprites/pUps/explosion_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0012.png", __ASSET__assets_images_sprites_pups_explosion_0012_png);
		type.set ("assets/images/sprites/pUps/explosion_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0013.png", __ASSET__assets_images_sprites_pups_explosion_0013_png);
		type.set ("assets/images/sprites/pUps/explosion_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0014.png", __ASSET__assets_images_sprites_pups_explosion_0014_png);
		type.set ("assets/images/sprites/pUps/explosion_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0015.png", __ASSET__assets_images_sprites_pups_explosion_0015_png);
		type.set ("assets/images/sprites/pUps/explosion_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0016.png", __ASSET__assets_images_sprites_pups_explosion_0016_png);
		type.set ("assets/images/sprites/pUps/explosion_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0017.png", __ASSET__assets_images_sprites_pups_explosion_0017_png);
		type.set ("assets/images/sprites/pUps/explosion_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0018.png", __ASSET__assets_images_sprites_pups_explosion_0018_png);
		type.set ("assets/images/sprites/pUps/explosion_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0019.png", __ASSET__assets_images_sprites_pups_explosion_0019_png);
		type.set ("assets/images/sprites/pUps/explosion_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0020.png", __ASSET__assets_images_sprites_pups_explosion_0020_png);
		type.set ("assets/images/sprites/pUps/explosion_0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0021.png", __ASSET__assets_images_sprites_pups_explosion_0021_png);
		type.set ("assets/images/sprites/pUps/explosion_0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0022.png", __ASSET__assets_images_sprites_pups_explosion_0022_png);
		type.set ("assets/images/sprites/pUps/explosion_0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0023.png", __ASSET__assets_images_sprites_pups_explosion_0023_png);
		type.set ("assets/images/sprites/pUps/explosion_0023.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0024.png", __ASSET__assets_images_sprites_pups_explosion_0024_png);
		type.set ("assets/images/sprites/pUps/explosion_0024.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0025.png", __ASSET__assets_images_sprites_pups_explosion_0025_png);
		type.set ("assets/images/sprites/pUps/explosion_0025.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0026.png", __ASSET__assets_images_sprites_pups_explosion_0026_png);
		type.set ("assets/images/sprites/pUps/explosion_0026.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0027.png", __ASSET__assets_images_sprites_pups_explosion_0027_png);
		type.set ("assets/images/sprites/pUps/explosion_0027.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0028.png", __ASSET__assets_images_sprites_pups_explosion_0028_png);
		type.set ("assets/images/sprites/pUps/explosion_0028.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0029.png", __ASSET__assets_images_sprites_pups_explosion_0029_png);
		type.set ("assets/images/sprites/pUps/explosion_0029.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0030.png", __ASSET__assets_images_sprites_pups_explosion_0030_png);
		type.set ("assets/images/sprites/pUps/explosion_0030.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0031.png", __ASSET__assets_images_sprites_pups_explosion_0031_png);
		type.set ("assets/images/sprites/pUps/explosion_0031.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0032.png", __ASSET__assets_images_sprites_pups_explosion_0032_png);
		type.set ("assets/images/sprites/pUps/explosion_0032.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0033.png", __ASSET__assets_images_sprites_pups_explosion_0033_png);
		type.set ("assets/images/sprites/pUps/explosion_0033.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0034.png", __ASSET__assets_images_sprites_pups_explosion_0034_png);
		type.set ("assets/images/sprites/pUps/explosion_0034.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0035.png", __ASSET__assets_images_sprites_pups_explosion_0035_png);
		type.set ("assets/images/sprites/pUps/explosion_0035.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/explosion_0036.png", __ASSET__assets_images_sprites_pups_explosion_0036_png);
		type.set ("assets/images/sprites/pUps/explosion_0036.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0001.png", __ASSET__assets_images_sprites_pups_magnet_main_0001_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0002.png", __ASSET__assets_images_sprites_pups_magnet_main_0002_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0002.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0003.png", __ASSET__assets_images_sprites_pups_magnet_main_0003_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0003.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0004.png", __ASSET__assets_images_sprites_pups_magnet_main_0004_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0004.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0005.png", __ASSET__assets_images_sprites_pups_magnet_main_0005_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0005.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0006.png", __ASSET__assets_images_sprites_pups_magnet_main_0006_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0006.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0007.png", __ASSET__assets_images_sprites_pups_magnet_main_0007_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0007.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0008.png", __ASSET__assets_images_sprites_pups_magnet_main_0008_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0008.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0009.png", __ASSET__assets_images_sprites_pups_magnet_main_0009_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0009.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0010.png", __ASSET__assets_images_sprites_pups_magnet_main_0010_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0010.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0011.png", __ASSET__assets_images_sprites_pups_magnet_main_0011_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0011.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0012.png", __ASSET__assets_images_sprites_pups_magnet_main_0012_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0012.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0013.png", __ASSET__assets_images_sprites_pups_magnet_main_0013_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0013.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0014.png", __ASSET__assets_images_sprites_pups_magnet_main_0014_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0014.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0015.png", __ASSET__assets_images_sprites_pups_magnet_main_0015_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0015.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0016.png", __ASSET__assets_images_sprites_pups_magnet_main_0016_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0016.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0017.png", __ASSET__assets_images_sprites_pups_magnet_main_0017_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0017.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0018.png", __ASSET__assets_images_sprites_pups_magnet_main_0018_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0018.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0019.png", __ASSET__assets_images_sprites_pups_magnet_main_0019_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0019.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0020.png", __ASSET__assets_images_sprites_pups_magnet_main_0020_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0020.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0021.png", __ASSET__assets_images_sprites_pups_magnet_main_0021_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0021.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0022.png", __ASSET__assets_images_sprites_pups_magnet_main_0022_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0022.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0023.png", __ASSET__assets_images_sprites_pups_magnet_main_0023_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0023.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0024.png", __ASSET__assets_images_sprites_pups_magnet_main_0024_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0024.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0025.png", __ASSET__assets_images_sprites_pups_magnet_main_0025_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0025.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0026.png", __ASSET__assets_images_sprites_pups_magnet_main_0026_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0026.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0027.png", __ASSET__assets_images_sprites_pups_magnet_main_0027_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0027.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0028.png", __ASSET__assets_images_sprites_pups_magnet_main_0028_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0028.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0029.png", __ASSET__assets_images_sprites_pups_magnet_main_0029_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0029.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0030.png", __ASSET__assets_images_sprites_pups_magnet_main_0030_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0030.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0031.png", __ASSET__assets_images_sprites_pups_magnet_main_0031_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0031.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0032.png", __ASSET__assets_images_sprites_pups_magnet_main_0032_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0032.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0033.png", __ASSET__assets_images_sprites_pups_magnet_main_0033_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0033.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0034.png", __ASSET__assets_images_sprites_pups_magnet_main_0034_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0034.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0035.png", __ASSET__assets_images_sprites_pups_magnet_main_0035_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0035.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0036.png", __ASSET__assets_images_sprites_pups_magnet_main_0036_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0036.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0037.png", __ASSET__assets_images_sprites_pups_magnet_main_0037_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0037.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0038.png", __ASSET__assets_images_sprites_pups_magnet_main_0038_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0038.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0039.png", __ASSET__assets_images_sprites_pups_magnet_main_0039_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0039.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0040.png", __ASSET__assets_images_sprites_pups_magnet_main_0040_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0040.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0041.png", __ASSET__assets_images_sprites_pups_magnet_main_0041_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0041.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0042.png", __ASSET__assets_images_sprites_pups_magnet_main_0042_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0042.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0043.png", __ASSET__assets_images_sprites_pups_magnet_main_0043_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0043.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0044.png", __ASSET__assets_images_sprites_pups_magnet_main_0044_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0044.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0045.png", __ASSET__assets_images_sprites_pups_magnet_main_0045_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0045.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0046.png", __ASSET__assets_images_sprites_pups_magnet_main_0046_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0046.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0047.png", __ASSET__assets_images_sprites_pups_magnet_main_0047_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0047.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_main_0048.png", __ASSET__assets_images_sprites_pups_magnet_main_0048_png);
		type.set ("assets/images/sprites/pUps/magnet_main_0048.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprites/pUps/magnet_solo.png", __ASSET__assets_images_sprites_pups_magnet_solo_png);
		type.set ("assets/images/sprites/pUps/magnet_solo.png", AssetType.IMAGE);
		
		className.set ("assets/images/spritesheetTp.png", __ASSET__assets_images_spritesheettp_png);
		type.set ("assets/images/spritesheetTp.png", AssetType.IMAGE);
		
		className.set ("assets/images/tile01.png", __ASSET__assets_images_tile01_png);
		type.set ("assets/images/tile01.png", AssetType.IMAGE);
		
		className.set ("assets/images/towerfall_test2_002.png", __ASSET__assets_images_towerfall_test2_002_png);
		type.set ("assets/images/towerfall_test2_002.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/backloop.ogg", __ASSET__assets_sounds_backloop_ogg);
		type.set ("assets/sounds/backloop.ogg", AssetType.MUSIC);
		
		className.set ("assets/sounds/clash.mp3", __ASSET__assets_sounds_clash_mp3);
		type.set ("assets/sounds/clash.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/clash.ogg", __ASSET__assets_sounds_clash_ogg);
		type.set ("assets/sounds/clash.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/electrify.ogg", __ASSET__assets_sounds_electrify_ogg);
		type.set ("assets/sounds/electrify.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/explode.ogg", __ASSET__assets_sounds_explode_ogg);
		type.set ("assets/sounds/explode.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/explodemini.wav", __ASSET__assets_sounds_explodemini_wav);
		type.set ("assets/sounds/explodemini.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/hurt.mp3", __ASSET__assets_sounds_hurt_mp3);
		type.set ("assets/sounds/hurt.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/hurt.ogg", __ASSET__assets_sounds_hurt_ogg);
		type.set ("assets/sounds/hurt.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/jump.ogg", __ASSET__assets_sounds_jump_ogg);
		type.set ("assets/sounds/jump.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/magnet_appear.ogg", __ASSET__assets_sounds_magnet_appear_ogg);
		type.set ("assets/sounds/magnet_appear.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/slash.mp3", __ASSET__assets_sounds_slash_mp3);
		type.set ("assets/sounds/slash.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/slash.ogg", __ASSET__assets_sounds_slash_ogg);
		type.set ("assets/sounds/slash.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/touch_ground.ogg", __ASSET__assets_sounds_touch_ground_ogg);
		type.set ("assets/sounds/touch_ground.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		className.set ("clash", __ASSET__assets_sounds_clash_mp4);
		type.set ("clash", AssetType.SOUND);
		
		className.set ("slash", __ASSET__assets_sounds_slash_mp4);
		type.set ("slash", AssetType.SOUND);
		
		className.set ("hurt", __ASSET__assets_sounds_hurt_mp4);
		type.set ("hurt", AssetType.SOUND);
		
		className.set ("electrify", __ASSET__assets_sounds_hurt_mp5);
		type.set ("electrify", AssetType.SOUND);
		
		className.set ("background", __ASSET__assets_sounds_hurt_mp6);
		type.set ("background", AssetType.SOUND);
		
		className.set ("magnet_appear", __ASSET__assets_sounds_hurt_mp7);
		type.set ("magnet_appear", AssetType.SOUND);
		
		className.set ("touch_ground", __ASSET__assets_sounds_hurt_mp8);
		type.set ("touch_ground", AssetType.SOUND);
		
		className.set ("jump", __ASSET__assets_sounds_hurt_mp9);
		type.set ("jump", AssetType.SOUND);
		
		className.set ("explode", __ASSET__assets_sounds_hurt_mp10);
		type.set ("explode", AssetType.SOUND);
		
		
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
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
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
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
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
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				handler (loader.data);
				
			});
			
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		var worker = new BackgroundWorker ();
		
		worker.doWork.add (function (_) {
			
			worker.sendComplete (getBytes (id));
			
		});
		
		worker.onComplete.add (handler);
		worker.run ();
		
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
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				handler (Image.fromImageElement (image));
				
			}
			image.src = id;
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		var worker = new BackgroundWorker ();
		
		worker.doWork.add (function (_) {
			
			worker.sendComplete (getImage (id));
			
		});
		
		worker.onComplete.add (handler);
		worker.run ();
		
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
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				handler (loader.data);
				
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


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_big_version_dam extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_big_version_dam_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_mapcsv_group1_map1_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_megaversion_dam extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_megaversion_dam_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_megaversion3_dam extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_spritesdata_json extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_texture_tps extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_texturenew_tps extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_texturewithfolders_tps extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_charlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_citycartoon_01_swf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_conceptlab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_ligth_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_marco_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_piedritas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_scenelightblue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief__sword_floorsidecutexport0014removed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief__sword_floorsidecutexport0015removed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0025_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0026_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0027_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0028_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0029_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0030_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0031_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0032_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0033_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0034_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0035_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0036_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0037_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0038_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0039_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0040_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0041_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0042_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0043_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0044_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0045_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0046_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0025_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_run2export0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashguntrailexport_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_dashtrailexport_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk__punk_attack_floorside_0001removed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk__punk_attack_floorside_0015removed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk__punk_attack_floorside_0016removed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk__punk_attack_floorside_0017removed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk__punk_attack_floorside_0018removed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_dash__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0025_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0026_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0027_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0028_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0029_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0030_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0031_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0032_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0033_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0034_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0035_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0036_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0037_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0038_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0039_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0040_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0041_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0042_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0043_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0044_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0045_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0046_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0025_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_punk_walljump_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_bomb_big_white_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_bomb_big_white_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_crate_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0025_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0026_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0027_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0028_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0029_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0030_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0031_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0032_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0033_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0034_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0035_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0036_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0025_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0026_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0027_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0028_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0029_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0030_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0031_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0032_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0033_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0034_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0035_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0036_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0037_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0038_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0039_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0040_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0041_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0042_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0043_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0044_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0045_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0046_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0047_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0048_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprites_pups_magnet_solo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_spritesheettp_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tile01_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_towerfall_test2_002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_backloop_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_clash_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_clash_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_electrify_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_explode_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_explodemini_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jump_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_magnet_appear_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_slash_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_slash_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_touch_ground_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_clash_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_slash_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp5 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp6 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp7 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp8 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp9 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp10 extends flash.media.Sound { }


#elseif html5



















































































































































































































































































































































































































































































































































































































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 











#else



#if (windows || mac || linux)


@:file("assets/data/big version.dam") #if display private #end class __ASSET__assets_data_big_version_dam extends lime.utils.ByteArray {}
@:file("assets/data/big version.dam.bak") #if display private #end class __ASSET__assets_data_big_version_dam_bak extends lime.utils.ByteArray {}
@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/data/mapCSV_Group1_Map1.csv") #if display private #end class __ASSET__assets_data_mapcsv_group1_map1_csv extends lime.utils.ByteArray {}
@:file("assets/data/megaversion.dam") #if display private #end class __ASSET__assets_data_megaversion_dam extends lime.utils.ByteArray {}
@:file("assets/data/megaversion.dam.bak") #if display private #end class __ASSET__assets_data_megaversion_dam_bak extends lime.utils.ByteArray {}
@:file("assets/data/megaversion3.dam") #if display private #end class __ASSET__assets_data_megaversion3_dam extends lime.utils.ByteArray {}
@:file("assets/data/spritesData.json") #if display private #end class __ASSET__assets_data_spritesdata_json extends lime.utils.ByteArray {}
@:file("assets/data/texture.tps") #if display private #end class __ASSET__assets_data_texture_tps extends lime.utils.ByteArray {}
@:file("assets/data/textureNew.tps") #if display private #end class __ASSET__assets_data_texturenew_tps extends lime.utils.ByteArray {}
@:file("assets/data/textureWithFolders.tps") #if display private #end class __ASSET__assets_data_texturewithfolders_tps extends lime.utils.ByteArray {}
@:image("assets/images/1.png") #if display private #end class __ASSET__assets_images_1_png extends lime.graphics.Image {}
@:image("assets/images/2.png") #if display private #end class __ASSET__assets_images_2_png extends lime.graphics.Image {}
@:image("assets/images/charLight.png") #if display private #end class __ASSET__assets_images_charlight_png extends lime.graphics.Image {}
@:file("assets/images/cityCartoon_01.swf") #if display private #end class __ASSET__assets_images_citycartoon_01_swf extends lime.utils.ByteArray {}
@:image("assets/images/conceptLab.png") #if display private #end class __ASSET__assets_images_conceptlab_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/images/ligth.png") #if display private #end class __ASSET__assets_images_ligth_png extends lime.graphics.Image {}
@:image("assets/images/marco.png") #if display private #end class __ASSET__assets_images_marco_png extends lime.graphics.Image {}
@:image("assets/images/piedritas.png") #if display private #end class __ASSET__assets_images_piedritas_png extends lime.graphics.Image {}
@:image("assets/images/sceneLightBlue.png") #if display private #end class __ASSET__assets_images_scenelightblue_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/-sword_floorSideCutExport0014REMOVED.png") #if display private #end class __ASSET__assets_images_sprites_chief__sword_floorsidecutexport0014removed_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/-sword_floorSideCutExport0015REMOVED.png") #if display private #end class __ASSET__assets_images_sprites_chief__sword_floorsidecutexport0015removed_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0007.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0008.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0009.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0010.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0011.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0012.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0013.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0014.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0015.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0016.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0017.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0018.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0019.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0020.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0021.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0022.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0023.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0023_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0024.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0024_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0025.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0025_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0026.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0026_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0027.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0027_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0028.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0028_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0029.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0029_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0030.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0030_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0031.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0031_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0032.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0032_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0033.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0033_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0034.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0034_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0035.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0035_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0036.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0036_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0037.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0037_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0038.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0038_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0039.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0039_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0040.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0040_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0041.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0041_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0042.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0042_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0043.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0043_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0044.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0044_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0045.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0045_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/AirDeathExport0046.png") #if display private #end class __ASSET__assets_images_sprites_chief_airdeathexport0046_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0007.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0008.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0009.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0010.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/Chief_CoverNoBallExport0011.png") #if display private #end class __ASSET__assets_images_sprites_chief_chief_covernoballexport0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0007.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0008.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0009.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0010.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0011.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0012.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0013.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0014.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0015.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0016.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0017.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0018.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0019.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0020.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0021.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0022.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0023.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0023_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0024.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0024_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/IdleExport0025.png") #if display private #end class __ASSET__assets_images_sprites_chief_idleexport0025_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpDownExport0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpDownExport0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpDownExport0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpDownExport0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpDownExport0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpDownExport0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpdownexport0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpFallExport0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpFallExport0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpFallExport0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpFallExport0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpFallExport0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpFallExport0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpfallexport0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpUpExport0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpUpExport0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpUpExport0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpUpExport0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpUpExport0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpUpExport0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/JumpUpExport0007.png") #if display private #end class __ASSET__assets_images_sprites_chief_jumpupexport0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0007.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0008.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0009.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0010.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0011.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0012.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0013.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0014.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0015.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0016.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0017.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0018.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0019.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0020.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0021.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0022.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/run2Export0023.png") #if display private #end class __ASSET__assets_images_sprites_chief_run2export0023_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0007.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0008.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0009.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0010.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0011.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0012.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0013.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0014.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0015.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0016.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0017.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0018.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorDown0019.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floordown0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0007.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0008.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0009.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0010.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0011.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0012.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorSideCutExport0013.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorsidecutexport0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0007.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0008.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0009.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0010.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0011.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0012.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0013.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0014.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/sword_floorUpExport0015.png") #if display private #end class __ASSET__assets_images_sprites_chief_sword_floorupexport0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/wallJumpOutExport0001.png") #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/wallJumpOutExport0002.png") #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/wallJumpOutExport0003.png") #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/wallJumpOutExport0004.png") #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/wallJumpOutExport0005.png") #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/chief/wallJumpOutExport0006.png") #if display private #end class __ASSET__assets_images_sprites_chief_walljumpoutexport0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0001.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0002.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0003.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0004.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0005.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0006.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0007.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0008.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0009.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0010.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/dashCloudEXPORT0011.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashcloudexport0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/DashFloor1EXPORT0001.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/DashFloor1EXPORT0002.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/DashFloor1EXPORT0003.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/DashFloor1EXPORT0004.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/DashFloor1EXPORT0005.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/DashFloor1EXPORT0006.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/DashFloor1EXPORT0007.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/DashFloor1EXPORT0008.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashfloor1export0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/DashGunTrailEXPORT.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashguntrailexport_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/DashTrailExport.png") #if display private #end class __ASSET__assets_images_sprites_fx_dashtrailexport_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0001.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0002.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0003.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0004.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0005.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0006.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0007.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0008.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0009.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0010.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0011.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0012.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0013.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0014.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0015.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0016.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0017.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0018.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0019.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0020.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0021.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_0022.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0001.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0002.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0003.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0004.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0005.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0006.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0007.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0008.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0009.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0010.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0011.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0012.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0013.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0014.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0015.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0016.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0017.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0018.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0019.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0020.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0021.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0022.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0023.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0023_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorFall_2_0024.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorfall_2_0024_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0001.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0002.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0003.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0004.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0005.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0006.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0007.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0008.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0009.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0010.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0011.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0012.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0013.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0014.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0015.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0016.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0017.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0018.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0019.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0020.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0021.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0022.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0023.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0023_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump1_0024.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump1_0024_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0001.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0002.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0003.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0004.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0005.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0006.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0007.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0008.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0009.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0010.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0011.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0012.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0013.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0014.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0015.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0016.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0017.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0018.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/floorJump2_0019.png") #if display private #end class __ASSET__assets_images_sprites_fx_floorjump2_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0001.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0002.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0003.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0004.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0005.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0006.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0007.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0008.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0009.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0010.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0011.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0012.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0013.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/fx_run_0014.png") #if display private #end class __ASSET__assets_images_sprites_fx_fx_run_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0001.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0002.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0003.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0004.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0005.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0006.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0007.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0008.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0009.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0010.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/swordHit0011.png") #if display private #end class __ASSET__assets_images_sprites_fx_swordhit0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0001.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0002.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0003.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0004.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0005.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0006.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0007.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0008.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0009.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0010.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0011.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0012.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0013.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0014.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0015.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0016.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0017.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0018.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0019.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/FX/wallLoop_0020.png") #if display private #end class __ASSET__assets_images_sprites_fx_wallloop_0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/-punk_attack_floorSide_0001REMOVED.png") #if display private #end class __ASSET__assets_images_sprites_punk__punk_attack_floorside_0001removed_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/-punk_attack_floorSide_0015REMOVED.png") #if display private #end class __ASSET__assets_images_sprites_punk__punk_attack_floorside_0015removed_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/-punk_attack_floorSide_0016REMOVED.png") #if display private #end class __ASSET__assets_images_sprites_punk__punk_attack_floorside_0016removed_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/-punk_attack_floorSide_0017REMOVED.png") #if display private #end class __ASSET__assets_images_sprites_punk__punk_attack_floorside_0017removed_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/-punk_attack_floorSide_0018REMOVED.png") #if display private #end class __ASSET__assets_images_sprites_punk__punk_attack_floorside_0018removed_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0001.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0002.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0003.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0004.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0005.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0006.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0007.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0008.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0009.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0010.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0011.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0012.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0013.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0014.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0015.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0016.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0017.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0018.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorDown_0019.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floordown_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0002.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0003.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0004.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0005.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0006.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0007.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0008.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0009.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0010.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0011.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0012.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0013.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorSide_0014.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorside_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0001.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0002.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0003.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0004.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0005.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0006.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0007.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0008.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0009.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0010.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0011.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0012.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0013.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0014.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_attack_floorUp_0015.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_attack_floorup_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_dash_.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_dash__png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0001.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0002.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0003.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0004.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0005.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0006.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0007.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0008.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0009.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0010.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0011.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0012.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0013.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0014.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0015.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0016.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0017.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0018.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0019.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0020.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0021.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0022.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0023.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0023_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0024.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0024_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0025.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0025_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0026.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0026_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0027.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0027_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0028.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0028_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0029.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0029_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0030.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0030_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0031.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0031_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0032.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0032_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0033.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0033_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0034.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0034_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0035.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0035_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0036.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0036_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0037.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0037_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0038.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0038_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0039.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0039_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0040.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0040_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0041.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0041_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0042.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0042_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0043.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0043_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0044.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0044_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0045.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0045_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_death_0046.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_death_0046_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0001.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0002.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0003.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0004.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0005.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0006.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0007.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0008.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0009.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0010.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0011.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0012.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0013.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0014.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0015.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0016.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0017.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0018.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0019.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0020.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0021.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0022.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0023.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0023_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0024.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0024_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_idle_0025.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_idle_0025_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_jumpDown_0001.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_jumpDown_0002.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_jumpDown_0003.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_jumpDown_0004.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_jumpDown_0005.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_jumpDown_0006.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_jumpdown_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/punk_walljump_0001.png") #if display private #end class __ASSET__assets_images_sprites_punk_punk_walljump_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0001.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0002.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0003.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0004.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0005.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0006.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0007.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0008.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0009.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0010.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0011.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0012.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0013.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0014.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0015.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0016.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0017.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0018.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0019.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0020.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0021.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0022.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0023.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0023_png extends lime.graphics.Image {}
@:image("assets/images/sprites/punk/runPunk_0024.png") #if display private #end class __ASSET__assets_images_sprites_punk_runpunk_0024_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/bombo_big_load_0001.png") #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/bombo_big_load_0002.png") #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/bombo_big_load_0003.png") #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/bombo_big_load_0004.png") #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/bombo_big_load_0005.png") #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/bombo_big_load_0006.png") #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/bombo_big_load_0007.png") #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/bombo_big_load_0008.png") #if display private #end class __ASSET__assets_images_sprites_pups_bombo_big_load_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/bomb_big_white_0001.png") #if display private #end class __ASSET__assets_images_sprites_pups_bomb_big_white_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/bomb_big_white_0002.png") #if display private #end class __ASSET__assets_images_sprites_pups_bomb_big_white_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/Crate.png") #if display private #end class __ASSET__assets_images_sprites_pups_crate_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0001.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0002.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0003.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0004.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0005.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0006.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0007.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0008.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0009.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0010.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0011.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0012.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0013.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0014.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0015.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0016.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0017.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0018.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0019.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0020.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0021.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0022.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0023.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0023_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0024.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0024_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0025.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0025_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0026.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0026_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0027.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0027_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0028.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0028_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0029.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0029_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0030.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0030_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0031.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0031_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0032.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0032_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0033.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0033_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0034.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0034_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0035.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0035_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/explosion_0036.png") #if display private #end class __ASSET__assets_images_sprites_pups_explosion_0036_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0001.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0001_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0002.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0002_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0003.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0003_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0004.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0004_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0005.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0005_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0006.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0006_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0007.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0007_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0008.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0008_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0009.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0009_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0010.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0010_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0011.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0011_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0012.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0012_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0013.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0013_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0014.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0014_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0015.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0015_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0016.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0016_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0017.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0017_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0018.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0018_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0019.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0019_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0020.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0020_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0021.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0021_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0022.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0022_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0023.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0023_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0024.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0024_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0025.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0025_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0026.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0026_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0027.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0027_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0028.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0028_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0029.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0029_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0030.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0030_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0031.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0031_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0032.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0032_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0033.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0033_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0034.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0034_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0035.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0035_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0036.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0036_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0037.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0037_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0038.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0038_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0039.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0039_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0040.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0040_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0041.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0041_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0042.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0042_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0043.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0043_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0044.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0044_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0045.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0045_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0046.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0046_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0047.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0047_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_main_0048.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_main_0048_png extends lime.graphics.Image {}
@:image("assets/images/sprites/pUps/magnet_solo.png") #if display private #end class __ASSET__assets_images_sprites_pups_magnet_solo_png extends lime.graphics.Image {}
@:image("assets/images/spritesheetTp.png") #if display private #end class __ASSET__assets_images_spritesheettp_png extends lime.graphics.Image {}
@:image("assets/images/tile01.png") #if display private #end class __ASSET__assets_images_tile01_png extends lime.graphics.Image {}
@:image("assets/images/towerfall_test2_002.png") #if display private #end class __ASSET__assets_images_towerfall_test2_002_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/backloop.ogg") #if display private #end class __ASSET__assets_sounds_backloop_ogg extends lime.utils.ByteArray {}
@:file("assets/sounds/clash.mp3") #if display private #end class __ASSET__assets_sounds_clash_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/clash.ogg") #if display private #end class __ASSET__assets_sounds_clash_ogg extends lime.utils.ByteArray {}
@:file("assets/sounds/electrify.ogg") #if display private #end class __ASSET__assets_sounds_electrify_ogg extends lime.utils.ByteArray {}
@:file("assets/sounds/explode.ogg") #if display private #end class __ASSET__assets_sounds_explode_ogg extends lime.utils.ByteArray {}
@:file("assets/sounds/explodemini.wav") #if display private #end class __ASSET__assets_sounds_explodemini_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/hurt.ogg") #if display private #end class __ASSET__assets_sounds_hurt_ogg extends lime.utils.ByteArray {}
@:file("assets/sounds/jump.ogg") #if display private #end class __ASSET__assets_sounds_jump_ogg extends lime.utils.ByteArray {}
@:file("assets/sounds/magnet_appear.ogg") #if display private #end class __ASSET__assets_sounds_magnet_appear_ogg extends lime.utils.ByteArray {}
@:file("assets/sounds/slash.mp3") #if display private #end class __ASSET__assets_sounds_slash_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/slash.ogg") #if display private #end class __ASSET__assets_sounds_slash_ogg extends lime.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/touch_ground.ogg") #if display private #end class __ASSET__assets_sounds_touch_ground_ogg extends lime.utils.ByteArray {}
@:file("C:/Users/Esti/android/flixel/3,3,10/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/Users/Esti/android/flixel/3,3,10/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:font("C:/Users/Esti/android/flixel/3,3,10/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/Users/Esti/android/flixel/3,3,10/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}
@:file("assets/sounds/clash.mp3") #if display private #end class __ASSET__assets_sounds_clash_mp4 extends lime.utils.ByteArray {}
@:file("assets/sounds/slash.mp3") #if display private #end class __ASSET__assets_sounds_slash_mp4 extends lime.utils.ByteArray {}
@:file("assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp4 extends lime.utils.ByteArray {}
@:file("assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp5 extends lime.utils.ByteArray {}
@:file("assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp6 extends lime.utils.ByteArray {}
@:file("assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp7 extends lime.utils.ByteArray {}
@:file("assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp8 extends lime.utils.ByteArray {}
@:file("assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp9 extends lime.utils.ByteArray {}
@:file("assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp10 extends lime.utils.ByteArray {}



#end

#if openfl
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end
#end

