extends Node
var jump_time :float = 0
const max_jump_height : float = 1.5

func count_time(delta:float) -> float:
	jump_time += delta
	
	return jump_time
