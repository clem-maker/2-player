class_name player_scribt
extends CharacterBody2D

const SPEED : float = 700
const JUMP_VELOCITY : float = -650.0
const max_jump_height : float = 1.5

var multiplayer_gravity_strenght : float
var jump_time :float = 0
var direction : float = 0
var clamped_jump_time : float
#state machine:
const states_avalibile : Array = ["default" , "jumping"]
var state = "default"

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
	jump_time += delta /2 #if both players acess this function then it growths twise as fast as intendet so you need to devide it by two.
	print(jump_time)
	return jump_time 
func is_current_state_correct(current_state :String) ->int: 
	if is_on_floor() :
		current_state = states_avalibile[0] #if player is on floor and the state is not equal to states_Avalabile[0],
		#                                    ("default") than change the variable states to "default", LOWERCASE!
	elif not is_on_floor() :
		current_state = states_avalibile[1]#if player is on floor and the state is not equal to states_Avalabile[1],
		#                                    ("jumping") than change the variable states to "default", LOWERCASE!

	if current_state == "default": return 0
	elif current_state =="jumping": return 1
	
	else:
		get_tree().quit(1) #ERROR state not avalibile
		return 1
func change_state_to(new_state : String) ->void:
	if state in states_avalibile:
		state = new_state
		print(state)
		return
	print_debug("Fehler state not avalible")
func _input(_event: InputEvent) -> void:
	if state in states_avalibile:# always
		#moving (right/left)
		direction = get_direction() #Input.get_axis("left","right")
		
		#cheak if Input spacebutton is equal to jump, if true the state will be set to jumping:
		if Input.is_action_pressed("jump") and get_state() != 1: # if jumpbutton and state is not allready set to jump (so you don't make a dpuble jump or jump in the air ) 
			state = states_avalibile[is_current_state_correct(state)] #debug states here:    print("curren state is:",is_current_state_correct(state))
			change_state_to(states_avalibile[1]) #state is set to jump
			
	#jumping logic
	if state == states_avalibile[1]: #jumping
		#jumpen
		var delta = get_process_delta_time()
		if Input.is_action_pressed("jump") and is_on_floor():
			jump_time = count_time(delta) #debug jump :   print(jump_time)
			clamped_jump_time = clampf( jump_time , 0.5, max_jump_height)
		#release the jump:
		if Input.is_action_just_released("jump"):
			velocity.y = clamped_jump_time * JUMP_VELOCITY
			jump_time = 0
func _physics_process(delta: float) -> void:
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
