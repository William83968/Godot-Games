extends KinematicBody2D

const SPEED = 1000.0
var motion = Vector2.ZERO

var armor = 4 setget set_armor

const scn_flare = preload("res://scenes/flare.tscn")
const scn_laser = preload("res://scenes/laser_ship.tscn")
const scn_explosion = preload("res://scenes/Explosion.tscn")

signal armor_changed

func _ready():
	add_to_group("ship")
	shoot()

# warning-ignore:unused_argument
func _physics_process(delta) -> void:
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y_input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	motion = Vector2(x_input * SPEED, y_input * SPEED)
	
# warning-ignore:return_value_discarded
	move_and_slide(motion)
	
func shoot():
	while true:
		create_laser($L_pos.global_position)
		create_laser($R_pos.global_position)
		yield(Utils.create_timer(0.25), "timeout")
		
	
func create_laser(pos):
	var laser = scn_laser.instance()
	var flare = scn_flare.instance()
	laser.global_position = pos
	flare.global_position = pos
	Utils.main_node.call_deferred("add_child", laser)
	Utils.main_node.call_deferred("add_child", flare)
	
func set_armor(new_value):
	armor = new_value
	emit_signal("armor_changed", armor)
	if armor <= 0: 
		explode(self.global_position)
		
		queue_free()
	
func explode(pos):
	var explosion = scn_explosion.instance()
	explosion.global_position = pos
	Utils.main_node.call_deferred("add_child", explosion)
	
	
	
	

	
	
	
