extends Sprite

var score = 0 setget set_score

func set_score(new_value):
	score = new_value
	get_node("tex_score").text = str(score)
