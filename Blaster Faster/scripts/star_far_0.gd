extends Sprite

export var velocity = Vector2()

func _process(delta):
	translate(velocity * delta)
	if position.y > get_viewport_rect().size.y:
		position.y = -800
