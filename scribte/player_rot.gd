extends CharacterBody2D


const SPEED = 700
const JUMP_VELOCITY = -650.0



var multiplier
var jump_time :float = 0



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		if velocity.y > 0.0:
			multiplier = 2.2
		else:
			multiplier = 1.0
			
		velocity += get_gravity() * multiplier * delta
		
	#jumpen
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_time = count_time(delta)
		if Input.is_action_just_released("jump"):
			velocity.y = jump_time * JUMP_VELOCITY


	var direction := Input.get_axis("left_arrow","right_arrow")
	velocity.x = direction * SPEED
	
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func count_time(delta:float) -> float:
	jump_time += delta
	
	return jump_time
