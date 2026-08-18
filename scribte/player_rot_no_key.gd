extends CharacterBody2D


const SPEED = 700
const JUMP_VELOCITY = -650.0




func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("click") and get_tree().current_scene.name == "main":
		var local_mous_pos : Vector2 = get_local_mouse_position()
		shoot(local_mous_pos)


func shoot( loc_mouse_pos : Vector2 ,  target_symbol_packed_scene : PackedScene = preload("res://scens/target.tscn")):
	#speicher reservieren:
	var target_symbole = target_symbol_packed_scene.instantiate()
	
	#daten fuer symbole geben:
	target_symbole.position = loc_mouse_pos
	
	#zur scene hinzufuegen:
	add_child(target_symbole)
	
