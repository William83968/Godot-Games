extends KinematicBody2D

export var speed = 100
export var bullet_speed = 1000
var rotation_speed = 3
export var fire_rate = 0.4
signal shoot

var bullet = preload("res://Player/Bullet.tscn")
var can_fire = true

var velocity

func _process(delta):
	$Turret.look_at(get_global_mouse_position())
	var dir = Vector2(1, 0).rotated($Turret.global_rotation)
	
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.start($Turret/BulletPoint.global_position, dir)
		get_tree().get_root().add_child(bullet_instance)
		
		var bullet_instance2 = bullet.instance()
		bullet_instance2.start($Turret/BulletPoint2.global_position, dir)
		get_tree().get_root().add_child(bullet_instance2)
		
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
	
func _physics_process(delta):
	velocity = Vector2()
	var rot_dir = 0
	
	if Input.is_action_pressed("turn_left"):
		rot_dir -= 1
	if Input.is_action_pressed("turn_right"):
		rot_dir += 1
	rotation += rotation_speed * rot_dir * delta
	
	if Input.is_action_pressed("forward"):
		velocity += Vector2(0, -1).rotated(rotation)
	if Input.is_action_pressed("backward"):
		velocity += Vector2(0, 1).rotated(rotation)
	
	move_and_slide(velocity * speed)
