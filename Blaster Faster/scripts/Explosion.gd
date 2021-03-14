extends AnimatedSprite

func _ready():
	self.frame = 0
	self.play("explode")
	Utils.remote_call("camera", "shake", 30, 0.13)


func _on_Explosion_animation_finished():
	queue_free()
