extends AnimatedSprite


func _ready():
	frame = 0
	play("explosion")



func _on_Big_explosion_animation_finished():
	queue_free()
