shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}
uniform float scale =0.5;

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 pixelColor = texture(TEXTURE,UV);
	COLOR = pixelColor;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
