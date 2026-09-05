extends Sprite2D

@onready var timer_child : Timer = $Timer

func _ready() -> void:
	timer_child.start(-1)

func _process(_delta: float) -> void:
	material.set_shader_parameter("alpha_time", timer_child.wait_time)
	set_instance_shader_parameter("alpha_time",timer_child.wait_time)



func _on_timer_timeout() -> void:
	queue_free()
