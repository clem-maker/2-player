extends Node


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit(0)
		print("closing game...")
	if Input.is_action_just_pressed("restart_game"):
		SceneManager.change_scene_to("main")
		print("restarting game")
	if Input.is_action_just_pressed("fullscreen"):
		# Dies ist der korrekte Befehl:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
