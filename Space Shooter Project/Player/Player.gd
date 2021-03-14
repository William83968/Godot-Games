extends Area2D

const SHOOT: PackedScene = preload("res://Shoot/Shoot.tscn")
const EXPLOSION_FX: PackedScene = preload("res://Explosion/Explosion.tscn")

export var SPEED: = 1.5

onready var WINDOW_SIZE: Vector2  = get_viewport_rect().size
onready var TWEEN: Tween = $Tween
onready var SPRITE: AnimatedSprite = $AnimatedSprite
onready var FLASH: AnimatedSprite = $Flash
onready var SHOT_POSITION: Position2D = $ShotPosition

signal Player_Died

var player_ready:= false

func _ready() -> void:
	respawn()



func _process(_delta: float) -> void:
	if not player_ready:
		return
		
	position += get_move_direction().normalized() * SPEED
	position.x = clamp(position.x, 16, WINDOW_SIZE.x - 64)
	position.y = clamp(position.y, 8, WINDOW_SIZE.y - 8)
	
	
	animation_manager(get_move_direction())
	
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
		FLASH.play("default")
	if Input.is_action_just_released("ui_accept"):
		FLASH.play("none")

	
	
func animation_manager(dir: Vector2):

	if dir.y == 1:
		SPRITE.play("down")
	elif dir.y == -1:
		SPRITE.play("up")
	else:
		SPRITE.play("default")

func respawn()->void:
	var init_position:= Vector2(-100, 80)
	var final_position:= Vector2(50,80)
	var _t = TWEEN.interpolate_property(
		self,
		"position",
		init_position,
		final_position,
		1.0,
		Tween.TRANS_CUBIC,
		Tween.EASE_OUT
		)
	var _st = TWEEN.start()	
	
	
func get_move_direction()-> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") -
		Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") -
		Input.get_action_strength("ui_up")
	)
	
func shoot()->void:
	
	var shoot = SHOOT.instance()
	var main = get_tree().current_scene
	main.add_child(shoot)
	shoot.global_position = SHOT_POSITION.global_position


func _on_Player_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		area.kill()
		kill()
		
func kill()->void:
	var main = get_tree().current_scene
	var explosion_fx = EXPLOSION_FX.instance()
	main.add_child(explosion_fx)
	explosion_fx.global_position = global_position
	player_ready = false
	PlayerData.deaths += 1
	emit_signal("Player_Died")
	respawn()

func _on_Tween_tween_completed(_object: Object, _key: NodePath) -> void:
	player_ready = true
