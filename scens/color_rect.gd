extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(material.get_shader_parameter("my_color"))
	#material.set_shader_parameter("my_color",Vector3(1.0,0.5,0.0))
