extends player_scribt

func get_direction():
	direction = Input.get_axis("left_arrow","right_arrow") #arrow keys
	return direction
