package states;

import flixel.tile.FlxTilemap;

class PlayState extends FlxState {
	public static var instance:PlayState = null;

	var map:FlxTilemap;

	var player:Player;

	var jumpTimer:Float = 0;
	var jumping:Bool = false;

	var camHUD:FlxCamera;

	override public function create() {
		super.create();

		SaveData.init();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		bg.scrollFactor.set();
		add(bg);

		map = new FlxTilemap();
		map.loadMapFromCSV(Paths.csv('levels/test-map'), Paths.image('tiles'), 16, 16);
		add(map);

		var text = new FlxText(0, 0, 0, "Hello World", 64);
		text.color = FlxColor.BLACK;
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

		FlxG.collide(map, player);
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

		// just in case
		if (FlxG.keys.justPressed.SPACE)
			trace('player position: ${player.x}, ${player.y}');
		
		/*
		if (jumping && !Input.justPressed('up'))
            jumping = false;

        if (player.isTouching(DOWN) && !jumping)
            jumpTimer = 0;

        if (jumpTimer >= 0 && Input.justPressed('up'))
        {
            jumping = true;
            jumpTimer += elapsed;
        }
        else
            jumpTimer = -1;

        if (jumpTimer > 0 && jumpTimer < 0.25)
            player.velocity.y = -300;
		*/
	}
}