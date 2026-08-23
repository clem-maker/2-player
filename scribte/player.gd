class_name player_scribt
extends CharacterBody2D
const SPEED = 700
const JUMP_VELOCITY = -650.0
const max_jump_height : float = 1.5

var multiplier
var jump_time :float = 0

func _physics_process(delta: float) -> void:
	#gravity
	if not is_on_floor():
		if velocity.y > 0.0:
			multiplier = 2.2
		else:
			multiplier = 1.0
			
		velocity += get_gravity() * multiplier * delta
		
	#jumpen
	if Input.is_action_pressed("jump") and is_on_floor():
		jump_time = count_time(delta) #debug jump :   print(jump_time)
	if Input.is_action_just_released("jump"):
		var clamped_jump_time = clampf( jump_time , 0.5, max_jump_height)
		velocity.y = clamped_jump_time * JUMP_VELOCITY
		reset_jumptime()


	var direction = get_direction()#Input.get_axis("left","right")
	velocity.x = direction * SPEED
	
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()


func get_direction():
	var direction = Input.get_axis("left","right")
	return direction
	
	
	
	



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
