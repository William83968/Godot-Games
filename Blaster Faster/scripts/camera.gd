extends Camera2D

var magnitude = 0
var time_left = 0
var is_shaking = false

	
func shake(new_magnitude, lifetime):
	if magnitude > new_magnitude: 
		return
	
	magnitude = new_magnitude
	time_left = lifetime
	
	if is_shaking: return
	is_shaking = true
	
	while time_left > 0:
		var pos = Vector2()
		pos.x = rand_range(-magnitude, magnitude)
		pos.y = rand_range(-magnitude, magnitude)
		self.position = pos
		
		time_left -= get_process_delta_time()
		yield(get_tree(), "idle_frame")
	
	magnitude = 0
	self.position = Vector2.ZERO
	is_shaking = false
