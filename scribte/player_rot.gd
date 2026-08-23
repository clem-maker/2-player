extends player_scribt

func get_direction():
	var direction = Input.get_axis("left_arrow","right_arrow")
	return direction
