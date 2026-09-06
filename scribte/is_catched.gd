extends Area2D

@onready var red_player : CharacterBody2D = $"../../player_red"
signal red_player_got_catched 



func _on_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if body == red_player:
		print(red_player.name,", got catched")
		red_player_got_catched.emit()
