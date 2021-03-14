extends "res://scripts/laser.gd"

const scn_flare = preload("res://scenes/flare.tscn")

func _ready():
	connect("area_entered", self, "_on_area_enter")
	
func create_flare():
	var flare = scn_flare.instance()
	flare.global_position = global_position
	Utils.main_node.call_deferred("add_child", flare)
	
func _on_area_enter(other):
	if other.is_in_group("enemy"):
		other.armor -= 1
		create_flare()
		Utils.remote_call("camera", "shake", 1, 0.13)
		queue_free()
