extends Area2D

export var armor = 2 setget set_armor
export var velocity = Vector2()

func _ready():
	add_to_group("enemy")
	connect("body_entered", self, "_on_body_entered")

func _process(delta) -> void:
	translate(velocity)
	
	if position.y > get_viewport_rect().size.y:
		queue_free()
		
func set_armor(new_value):
	armor = new_value
	if armor <= 0:
		Utils.search_node("spr_score").score += 5
		queue_free()
		
func _on_body_entered(other):
	if other.is_in_group("ship"):
		other.armor -= 1
		queue_free()
		
