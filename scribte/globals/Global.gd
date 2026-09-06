extends Node


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit(0)
	if Input.is_action_just_pressed("restart_game"):
		SceneManager.change_scene_to("main")
