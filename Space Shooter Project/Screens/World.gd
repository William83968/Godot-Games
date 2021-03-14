extends Node2D

onready var Red_Warning = preload("res://Autoload/Flash.tscn")
onready var score_count = get_node("Score_count")
onready var fx_player = get_node("FX_player")


func _process(delta) -> void:
	var Score = str(PlayerData.score)
	score_count.text = Score

