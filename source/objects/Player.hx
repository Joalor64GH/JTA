package objects;

import objects.Vector;

class Player extends FlxSprite {
	public var direction:Vector = new Vector(0, 0);
	public var speed:Vector = new Vector(0, 0);

	public function new(x:Float = 0, y:Float = 0) {
		super(x, y);
		makeGraphic(50, 75, FlxColor.GREEN);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		this.x += direction.dx * speed.dx;
		this.y += direction.dy * speed.dy;
	}
}