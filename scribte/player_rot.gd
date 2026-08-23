extends CharacterBody2D
const SPEED = 700
const JUMP_VELOCITY = -650.0
var multiplier

#const states : Array = ()


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
		JumpManager.jump_time = JumpManager.count_time(delta) #debug jump :   print(jump_time)
	if Input.is_action_just_released("jump"):
		var clamped_jump_time = clampf( JumpManager.jump_time , 0.5, JumpManager.max_jump_height)
		velocity.y = clamped_jump_time * JUMP_VELOCITY
		JumpManager.reset_jumptime()


	var direction := Input.get_axis("left_arrow","right_arrow")
	velocity.x = direction * SPEED
	
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
