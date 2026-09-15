extends Sprite2D

@export_group("tween_position's")
@export var start_position : Vector2
@export var endposition : Vector2

var tween_wolke : Tween = create_tween()
func _ready() -> void:
	tween_wolke.set_loops(0)
	tween_wolke.tween_property(self,"position",endposition,5.0)
	tween_wolke.tween_property(self,"position",start_position,0.0)
	
