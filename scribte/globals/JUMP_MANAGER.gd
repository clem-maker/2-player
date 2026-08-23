extends Node
const max_jump_height : float = 1.5

var jump_time :float = 0
var visited : int = 0


func count_time(delta:float) -> float:
	jump_time += delta /2 #if both players acess this function then it growths twise as fast as intendet so you need to devide it by two.
	return jump_time *1.05



# reset only if both players (red and blue have seen the jump_time value.)
func reset_jumptime():
	#cheaks if both (red and blue player) have seen the jump_time value.
	
	visited += 1
	
	#if both have than reset zero so the values don't stack.
	if visited >= 2:
		jump_time = 0
		#don't forget to reset the value:
		visited = 0
