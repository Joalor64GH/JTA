package backend;

using haxe.io.Path;

@:keep
class Paths {
	inline public static final DEFAULT_FOLDER:String = 'assets';

	static public function getPath(folder:Null<String>, file:String) {
		if (folder == null)
			folder = DEFAULT_FOLDER;
		return folder + '/' + file;
	}

	static public function file(file:String, folder:String = DEFAULT_FOLDER) {
		if (#if sys FileSystem.exists(folder) && #end (folder != null && folder != DEFAULT_FOLDER))
			return getPath(folder, file);
		return getPath(null, file);
	}

	inline static public function exists(asset:String)
		return FileAssets.exists(asset);

	inline static public function txt(key:String)
		return file('data/$key.txt');

	inline static public function xml(key:String)
		return file('data/$key.xml');

	inline static public function json(key:String)
		return file('data/$key.json');

	inline static public function ogmo(key:String)
		return file('data/$key.ogmo');

	inline static public function hxs(key:String)
		return file('data/$key.hxs');

	inline static public function sound(key:String)
		return file('sounds/$key.ogg');

	inline static public function music(key:String)
		return file('music/$key.ogg');

	inline static public function image(key:String)
		return file('images/$key.png');

	inline static public function font(key:String) {
		var path:String = file('fonts/$key');

		if (path.extension() == '') {
			if (exists(path.withExtension("ttf")))
				path = path.withExtension("ttf");
			else if (exists(path.withExtension("otf")))
				path = path.withExtension("otf");
		}

		return path;
	}
}

typedef FileAssets = #if sys FileSystem; #else openfl.utils.Assets; #end