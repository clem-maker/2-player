extends Node2D

func _ready() -> void:
	$players/player_blue/is_catched.red_player_got_catched.connect(_got_catched)
func _got_catched()-> void:
	print("Signal wurde empfangen.")
