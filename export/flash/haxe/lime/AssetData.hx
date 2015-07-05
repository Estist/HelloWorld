package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/big version.dam", "assets/data/big version.dam");
			type.set ("assets/data/big version.dam", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/big version.dam.bak", "assets/data/big version.dam.bak");
			type.set ("assets/data/big version.dam.bak", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/mapCSV_Group1_Map1.csv", "assets/data/mapCSV_Group1_Map1.csv");
			type.set ("assets/data/mapCSV_Group1_Map1.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/megaversion.dam", "assets/data/megaversion.dam");
			type.set ("assets/data/megaversion.dam", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/megaversion.dam.bak", "assets/data/megaversion.dam.bak");
			type.set ("assets/data/megaversion.dam.bak", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/spritesData.json", "assets/data/spritesData.json");
			type.set ("assets/data/spritesData.json", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/texture.tps", "assets/data/texture.tps");
			type.set ("assets/data/texture.tps", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/textureNew.tps", "assets/data/textureNew.tps");
			type.set ("assets/data/textureNew.tps", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/conceptLab.png", "assets/images/conceptLab.png");
			type.set ("assets/images/conceptLab.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/piedritas.png", "assets/images/piedritas.png");
			type.set ("assets/images/piedritas.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/spritesheetTp.png", "assets/images/spritesheetTp.png");
			type.set ("assets/images/spritesheetTp.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tile01.png", "assets/images/tile01.png");
			type.set ("assets/images/tile01.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/clash.mp3", "assets/sounds/clash.mp3");
			type.set ("assets/sounds/clash.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/clash.ogg", "assets/sounds/clash.ogg");
			type.set ("assets/sounds/clash.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/hurt.mp3", "assets/sounds/hurt.mp3");
			type.set ("assets/sounds/hurt.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/hurt.ogg", "assets/sounds/hurt.ogg");
			type.set ("assets/sounds/hurt.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/slash.mp3", "assets/sounds/slash.mp3");
			type.set ("assets/sounds/slash.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/slash.ogg", "assets/sounds/slash.ogg");
			type.set ("assets/sounds/slash.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/beep.mp3", "assets/sounds/beep.mp3");
			type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/flixel.mp3", "assets/sounds/flixel.mp3");
			type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("clash", "assets/sounds/clash.mp3");
			type.set ("clash", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("slash", "assets/sounds/slash.mp3");
			type.set ("slash", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("hurt", "assets/sounds/hurt.mp3");
			type.set ("hurt", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
