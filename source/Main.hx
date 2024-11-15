package;

import debug.FPS;

class Main extends openfl.display.Sprite {
	public final config:Dynamic = {
		gameDimensions: [800, 600],
		framerate: 60,
		initialState: PlayState,
		skipSplash: false,
		startFullscreen: false
	};

	public static var fpsDisplay:FPS;

	public function new() {
		super();

		addChild(new FlxGame(config.gameDimensions[0], config.gameDimensions[1], config.initialState, config.framerate, config.framerate,
			config.skipSplash, config.startFullscreen));

		fpsDisplay = new FPS(10, 10, 0xffffff);
		addChild(fpsDisplay);

		FlxG.mouse.visible = false;
	}

	public static function updateFramerate(newFramerate:Int) {
		if (newFramerate > FlxG.updateFramerate) {
			FlxG.updateFramerate = newFramerate;
			FlxG.drawFramerate = newFramerate;
		} else {
			FlxG.drawFramerate = newFramerate;
			FlxG.updateFramerate = newFramerate;
		}
	}
}