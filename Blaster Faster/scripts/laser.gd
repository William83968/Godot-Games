extends Area2D

export var velocity = Vector2()

func _ready():
	yield(get_node("vis_notifier"), "screen_exited")
	queue_free()

func _process(delta):
	translate(velocity)
	
