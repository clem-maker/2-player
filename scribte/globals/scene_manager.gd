extends Node

func change_scene_to(new_szene_name : String)->void:
	print("new scene: ",new_szene_name.to_lower())
	if new_szene_name.to_lower() == "ui":
		get_tree().change_scene_to_file("res://scens/ui.tscn")
	if new_szene_name.to_lower() == "main":
		get_tree().change_scene_to_file("res://scens/main.tscn")
