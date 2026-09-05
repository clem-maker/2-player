extends Node2D
# I will need this in the future so don't report it as a bug
var time:float = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	time += delta
	if time >= 1:  time =0
	#print(time)
