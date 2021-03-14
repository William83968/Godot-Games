extends KinematicBody2D 

var Speed = 500

func _ready():
	$AnimationPlayer.play("default")

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y_input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	move_and_slide(Vector2(x_input, y_input)*Speed)
	
	if Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("Attack")
	
			
	if x_input > 0:
		$Animation.flip_h = false
	elif x_input < 0:
		$Animation.flip_h = true


	


func _on_AnimationPlayer_animation_finished(anim_name):
	$Animation.frame = 3
	$AnimationPlayer.play("default")
