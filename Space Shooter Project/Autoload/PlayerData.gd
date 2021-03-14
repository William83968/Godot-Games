extends Node

signal score_updated
signal plaer_died

var score = 0 setget set_score
var deaths = 0 setget set_deaths

func set_score(value:int) -> void:
	score = value
	emit_signal("score_updated")
	
func set_deaths(value:int) -> void:
	deaths = value
	emit_signal("plaer_died")
