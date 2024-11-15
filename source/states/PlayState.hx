package states;

import flixel.addons.editors.ogmo.FlxOgmo3Loader;

class PlayState extends FlxState {
	public static var instance:PlayState = null;

	var player:Player;

	var jumpTimer:Float = 0;
    var jumping:Bool = false;

	var camHUD:FlxCamera;

	override public function create() {
		super.create();

		SaveData.init();

		var text = new FlxText(0, 0, 0, "Hello World", 64);
		text.screenCenter();
		add(text);

		player = new Player(FlxG.width / 2, FlxG.height / 2);
		player.maxVelocity.y = 300;
        player.acceleration.y = 900;
		add(player);

		FlxG.camera.zoom = 2.25;
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		FlxG.camera.follow(player, LOCKON);

		player.animation.play((player.velocity.x != 0) ? "walk" : "idle");
		player.velocity.x = Input.pressed('left') ? -150 : Input.pressed('right') ? 150 : 0;
		if (player.velocity.x != 0)
            player.flipX = player.velocity.x < 0;

		if (FlxG.keys.anyPressed([UP, W]))
			player.velocity.y = -100;
		else if (FlxG.keys.anyPressed([DOWN, S]))
			player.velocity.y = 100;
		else
			player.velocity.y = 0;
	}
}