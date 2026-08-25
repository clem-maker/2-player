class_name player_scribt
extends CharacterBody2D

const SPEED = 700
const JUMP_VELOCITY = -650.0
const max_jump_height : float = 1.5

var multiplier
var jump_time :float = 0
var direction

#state machine:
const states_avalibile : Array = ["default" , "jumping"]
var state = "default"

func get_direction():
	direction = Input.get_axis("left","right")
	return direction
func count_time(delta:float) -> float:
	jump_time += delta /2 #if both players acess this function then it growths twise as fast as intendet so you need to devide it by two.
	print(jump_time)
	return jump_time 

func _input(_event: InputEvent) -> void:
	
	#jumpen
	var delta = get_process_delta_time()
	if Input.is_action_pressed("jump") and is_on_floor():
		jump_time = count_time(delta) #debug jump :   print(jump_time)
	if Input.is_action_just_released("jump"):
		var clamped_jump_time = clampf( jump_time , 0.5, max_jump_height)
		velocity.y = clamped_jump_time * JUMP_VELOCITY
		jump_time = 0
	
	#moving (right/left)
	direction = get_direction() #Input.get_axis("left","right")
func _physics_process(delta: float) -> void:
	#gravity
	if not is_on_floor():
		if velocity.y > 0.0:
			multiplier = 2.2
		else:
			multiplier = 1.0
		velocity += get_gravity() * multiplier * delta
		
	#moving right/left
	velocity.x = direction * SPEED
	#smoth deaccleration
	if direction != 0:
		velocity.x = direction * SPEED #normel movment
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED) #if no input
	move_and_slide()
