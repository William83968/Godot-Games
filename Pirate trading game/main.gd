extends Panel

var Cash = 250
var firm_name = " Godot Pirate Trading Game"

func _ready():
	$cash_label.text = "Cash: $"+str(Cash)
	$firm_label.text = firm_name
