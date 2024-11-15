package objects;

class Player extends FlxSprite {
	public var direction:Vector = new Vector(0, 0);
	public var speed:Vector = new Vector(0, 0);

	public function new(x:Float = 0, y:Float = 0) {
		super(x, y);

		loadGraphic(Paths.image('player'), true, 16, 16);

		animation.add("idle", [0], 1);
		animation.add("walk", [1, 0, 2, 0], 12);
		animation.add("jump", [3], 1);
		animation.add("dead", [4], 1);

		animation.play("idle");
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		this.x += direction.dx * speed.dx;
		this.y += direction.dy * speed.dy;
	}
}