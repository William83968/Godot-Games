extends CanvasLayer

func _ready():
	Utils.attach("Player", "armor_changed", self, "_on_armor_changed")
	
func _on_armor_changed(armor):
	$spr_armor.frame = armor
	$anim_player.play("lose_health")
