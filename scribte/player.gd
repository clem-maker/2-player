class_name player_scribt
extends CharacterBody2D

const SPEED : float = 700
const JUMP_VELOCITY : float = -650.0
const max_jump_height : float = 1.5
const min_jump_height : float = 0.5

var multiplayer_gravity_strenght : float
var jump_time :float = 0
var direction : float = 0
var jump_time_local : float = 0
#state machine:
const states_avalibile : Array = ["default" , "jumping"]
var state = "default"

func is_state_default(state)->bool:
	if is_on_floor():
		return true
	else:
		return false
func get_state()->int:
	if state == "default": return 0
	elif state == "jumping": return 1
	else:
		print_debug("ERROR state does not exist.")
		return 0
func get_direction():
	var direction_local = Input.get_axis("left","right")
	return direction_local
func count_time(delta:float) -> float:
	if jump_time_local <max_jump_height:
		jump_time_local += delta /2 
		#print(jump_time) # 			<-- debug jumptime here 
	jump_time_local = maxf(jump_time_local , min_jump_height)
	return jump_time_local
func change_state_to(new_state : String) ->String:
	if new_state in states_avalibile:
		return new_state
	print_debug("Fehler state not avalible")
	return states_avalibile[0]
func _input(_event: InputEvent) -> void:
	if state in states_avalibile:# always
		#moving (right/left)
		direction = get_direction() #Input.get_axis("left","right")
		
		#cheak if Input spacebutton is equal to jump, if true the state will be set to jumping:
		if Input.is_action_pressed("jump") and get_state() != 1: # if jumpbutton and state is not allready set to jump (so you don't make a dpuble jump or jump in the air ) 
			#debug states here:    print("curren state is:",is_current_state_correct(state))
			state = change_state_to(states_avalibile[1]) #state is set to jump
			
	#jumping logic
	if state == states_avalibile[1]: #jumping
		#jumpen:
			
		#release the jump:
		if Input.is_action_just_released("jump"):
			velocity.y = jump_time * JUMP_VELOCITY
			jump_time_local = 0
func _physics_process(delta: float) -> void:
	if is_on_floor():
		state = states_avalibile[0]   # default
	else:
		state = states_avalibile[1]   # jumping
	if Input.is_action_pressed("jump") and is_on_floor():
		jump_time = count_time(delta) #debug jump :   print(jump_time)
	#jump_time_local = 0
	if state in states_avalibile: #immer
		#gravity
		if not is_on_floor():
			if velocity.y > 0.0:
				multiplayer_gravity_strenght = 2.2
			else:
				multiplayer_gravity_strenght = 1.0
			velocity += get_gravity() * multiplayer_gravity_strenght * delta
			

		#smoth deaccleration
		if direction != 0:
			velocity.x = direction * SPEED #normel movment
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED) #if no input
	move_and_slide()
	#if is_state_default(state) and state == states_avalibile[1]:
		#state = states_avalibile[0]
