extends Node

onready var Map : Navigation2D = $World_navigation
onready var line_2d : Line2D = $Line2D
onready var character : Sprite = $World_navigation/Pirateship

#func _unhandled_input(event: InputEvent) -> void:
#	if not event is InputEventMouseButton:
#		return
#	if event.button_index != BUTTON_LEFT or not event.is_pressed():
#		return
#
#	var new_path : = Map.get_simple_path(character.global_position, event.global_position)
#	line_2d.points = new_path
#	Map.Line_path = new_path

