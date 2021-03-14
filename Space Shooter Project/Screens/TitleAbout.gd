extends Node

onready var roll:Node2D = $Credits

func _unhandled_key_input(event: InputEventKey) -> void:

	if event.is_action_pressed("ui_accept"):
		var _r = get_tree().change_scene("res://Screens/TitleScreen.tscn")
		
func _process(_delta: float) -> void:
	roll.position.y -= .3
	if roll.position.y < -460:
		roll.position.y = 169
	
