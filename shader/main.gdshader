shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR.xy = UV;
	if (UV.x > 0.95 || UV.x < 0.05 || UV.y > 0.9 || UV.y < 0.1)
		{
		COLOR.rgb = vec3(0,0,0);
		}
}
