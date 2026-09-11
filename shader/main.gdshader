shader_type canvas_item;
uniform vec3 my_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = vec4(my_color , 1.0);
	
}
