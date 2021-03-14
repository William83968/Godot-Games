extends Area2D

const EXPLOSION_FX: PackedScene = preload("res://Explosion/Explosion.tscn")
const ASTEROID_SMALL: PackedScene = preload("res://AsteroidSmall/AsteroidSmall.tscn")

onready var WINDOW_SIZE: Vector2  = get_viewport_rect().size

export(Vector2) var SPEED = Vector2(10,40)
export(int) var health = 3

var dir := -1

func _ready() -> void:
	add_to_group("enemies")

func _process(delta: float) -> void:
	position.x -= SPEED.x * delta
	position.y -= SPEED.y * delta * dir
	
	rotation += 0.01
	
	if position.y > WINDOW_SIZE.y  or position.y < 0:
		dir *= -1
	

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
	
	
func kill()-> void:
	var main = get_tree().current_scene
	var asteroid = ASTEROID_SMALL.instance()
	main.call_deferred("add_child", asteroid )
	asteroid.global_position = global_position
	
	var asteroid_2 = ASTEROID_SMALL.instance()
	main.call_deferred("add_child", asteroid_2 )
	asteroid_2.global_position = global_position
	asteroid_2.dir = 1
	
	PlayerData.score += 10
	
	queue_free()


func _on_Asteroid_body_entered(body: Node) -> void:
	body.kill()
	
	health -= 1
	if health <= 0:
		kill()
