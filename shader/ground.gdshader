shader_type canvas_item;
uniform vec2 scale = vec2(10.0,1.0);

void vertex() {
	VERTEX *= scale;
	UV.x *= scale.x;
}


void fragment() {
	// Called for every pixel the material is visible on.
}
