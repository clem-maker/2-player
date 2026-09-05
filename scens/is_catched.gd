extends Area2D

@onready var red_player : Node2D = $"/players/player_rot"
signal red_player_got_catched 


func _on_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	pass
