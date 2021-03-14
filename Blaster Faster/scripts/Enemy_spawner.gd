extends Node

const enemy_kamikaze = preload("res://scenes/Kamikaze_enemy.tscn")
const enemy_clever = preload("res://scenes/Enemy_clever.tscn")

var spawn_timer = true
var spawn_range = 1.8

func _ready():
	randomize()
	spawn()
	
func spawn():
	while true:
		randomize()
		var enemy
		var spawn_index = rand_range(0.0, spawn_range)
		if spawn_index <= 1:
			enemy = enemy_kamikaze.instance()
		else:
			enemy = enemy_clever.instance()
		enemy.position.x  = rand_range(0, Utils.view_size.x)
		get_node("container").add_child(enemy)
		spawn_range += 0.1
		yield(Utils.create_timer(2.5), "timeout")
	
	
	
