extends ColorRect

func _ready():
	var AnimPlayer = $AnimPlayer
	AnimPlayer.play("flash")


func _on_AnimPlayer_animation_finished(anim_name):
	queue_free()
