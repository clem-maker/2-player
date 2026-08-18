shader_type canvas_item;

uniform float alpha_time = 1.0;

void fragment() {
	float alpha_value = 1.0 - alpha_time;
	COLOR.a *= alpha_value;
}
