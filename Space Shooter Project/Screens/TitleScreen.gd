extends Node

onready var pointer:Sprite = $Pointer

func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_action_pressed("ui_up"):
		pointer.position.y = 68
	if event.is_action_pressed("ui_down"):
		pointer.position.y = 88
	
	if event.is_action_pressed("ui_accept"):
		if pointer.position.y == 68:
			var _r = get_tree().change_scene("res://Screens/World.tscn")
		else:
			var _r = get_tree().change_scene("res://Screens/TitleAbout.tscn")
			
			
		
