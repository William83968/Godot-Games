extends AnimatedSprite

func _ready():
	frame = 0
	play("explode")

func _on_Explosion_animation_finished():
	queue_free()
