extends Area2D

const EXPLOSION_FX: PackedScene = preload("res://Explosion/Explosion.tscn")

export(float) var SPEED = 100.0

func _ready() -> void:
	add_to_group("enemies")
	$Sprite.play("spin")

func _process(delta: float) -> void:
	position.x -= SPEED * delta

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
	
func kill() -> void:
	var main = get_tree().current_scene
	var explosion_fx = EXPLOSION_FX.instance()
	main.add_child(explosion_fx)
	explosion_fx.global_position = global_position
	queue_free()
	
func _on_Enemy_body_entered(body: Node) -> void:
	body.kill()
	kill()
	PlayerData.score += 1
	
