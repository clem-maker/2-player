shader_type canvas_item;

void vertex() {
	COLOR.r = 2.0;
	COLOR.b = 0.3;
	COLOR.g = 0.4;
}

void fragment() {
	COLOR.w = step( distance(vec2( 0.5 , 0.5 ) , UV ), 0.49 ); //kreis frabig, rest transparent
}
