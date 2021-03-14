extends "res://scripts/Enemy.gd"

const scn_laser = preload("res://scenes/laser_enemy.tscn")
const scn_explosion = preload("res://scenes/Explosion.tscn")

func _ready():
	randomize()
	shoot()
	velocity.x = Utils.choose([velocity.x, -velocity.x])
	
func _process(delta):
	if position.x <= 40:
		velocity.x = abs(velocity.x)
	if position.x >= Utils.view_size.x-40:
		velocity.x = -abs(velocity.x)

func _on_Timer_timeout():
	shoot()
	
func shoot():
	var laser = scn_laser.instance()
	laser.global_position = $Cannon.global_position
	Utils.main_node.call_deferred("add_child", laser)
	var wait_time = rand_range(1.0, 1.8)
	
func set_armor(new_value):
	armor = new_value
	if armor <= 0:
		Utils.search_node("spr_score").score += 10
		explode(self.global_position)
		queue_free()
	
func explode(pos):
	var explosion = scn_explosion.instance()
	explosion.global_position = pos
	Utils.main_node.call_deferred("add_child", explosion)
