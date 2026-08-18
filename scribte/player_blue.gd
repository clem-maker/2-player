extends CharacterBody2D
var multiplier

const SPEED = 700
const JUMP_VELOCITY = -650.0

func _physics_process(delta: float) -> void:
	#gravity
	if not is_on_floor():
		if velocity.y > 0.0:
			multiplier = 2.2
		else:
			multiplier = 1.0
			
		velocity += get_gravity() * multiplier * delta
		
	#jumpen
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY 


	var direction := Input.get_axis("left","right")
	velocity.x = direction * SPEED
	
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
