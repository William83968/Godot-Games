extends "res://scripts/laser.gd"


func _ready():
	connect("body_entered", self, "_on_body_entered")
	
func _on_body_entered(other):
	if other.is_in_group("ship"):
		other.armor -= 1
		Utils.remote_call("camera", "shake", 1, 0.13)
		queue_free()
