extends Area2D

export(int) var speed
export(int) var damage
export(float) var lifetime

var velocity = Vector2()

var explosion = preload("res://Explosion.tscn")


func start(_position, _direction):
	position = _position
	rotation = _direction.angle()
	velocity = _direction * speed
	
func _process(delta):
	position += velocity * delta
	
func explode():
		var explosion_instance = explosion.instance()
		explosion_instance.position = get_global_position()
		get_tree().get_root().add_child(explosion_instance)
		queue_free()

func _on_Bullet_body_entered(body):
	if !body.is_in_group("player"):
		explode()
		if body.has_method('take_damage'):
			body.take_damage(damage)


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
