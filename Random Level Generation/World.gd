extends Node

const Player = preload("res://Player/Player.tscn")
const Exit = preload("res://Player/ExitDoor.tscn")

onready var tileMap = get_node("TileMap")

var borders = Rect2(1, 1, 38, 21)

func _ready():
	randomize()
	generate_level()
	
func generate_level():
	var walker = Walker.new(Vector2(19, 11), borders)
	var map = walker.walk(200)
	walker.queue_free()
	
	var player = Player.instance()
	add_child(player)
	player.position = map.front() * 32
	
	var exit = Exit.instance()
	add_child(exit)
	exit.position = walker.get_end_room().position*32
	exit.connect("leaving_level", self, "reload_level")
	
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)
	
func reload_level():
	get_tree().reload_current_scene()
		
	
	
	
