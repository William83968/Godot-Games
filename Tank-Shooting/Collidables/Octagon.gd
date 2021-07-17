extends StaticBody2D

var BIG_EXPLOSION = preload("res://Big_explosion.tscn")
var health = 100

func explosion():
		var big_explosion_instance = BIG_EXPLOSION.instance()
		big_explosion_instance.position = get_global_position()
		get_tree().get_root().add_child(big_explosion_instance)
		queue_free()


func take_damage(damage):
	health -= damage
	if health == 0:
		explosion()

