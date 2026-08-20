extends Node2D

var time:float = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	time += delta
	if time >= 1:  time =0
	#print(time)
func _exit_tree() -> void:
	print("ende",time)
