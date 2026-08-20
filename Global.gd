extends Node
var jump_time :float = 0

func count_time(delta:float) -> float:
	jump_time += delta
	return jump_time
