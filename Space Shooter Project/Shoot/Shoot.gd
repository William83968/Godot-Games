extends RigidBody2D


const HIT_EFFECT: PackedScene = preload("res://Hit/HitEffect.tscn")

func _ready():
	$AnimatedSprite.play()

func kill()->void:
	create_hit_effect()
	queue_free()

func create_hit_effect():
	var main = get_tree().current_scene
	var hitEffect = HIT_EFFECT.instance()
	main.add_child(hitEffect)
	hitEffect.global_position = global_position
