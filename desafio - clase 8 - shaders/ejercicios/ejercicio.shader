shader_type canvas_item;

uniform float width = 0.05;
uniform float progress : hint_range(0.1,0.9) = 0.5;
uniform vec4 color : hint_color;

float sdSegment( in vec2 p, in vec2 a, in vec2 b )
{
    vec2 pa = p-a, ba = b-a;
    float h = clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
    return length( pa - ba*h );
}

void fragment() {
	float scale = sdSegment(UV, vec2(0.1, 0.5), vec2(0.9, 0.5));
	vec3 lineBackground = vec3(1.0 - smoothstep(width, width + 0.01, scale));
	
	float scaleForeground = sdSegment(UV, vec2(0.1, 0.5), vec2(progress, 0.5));
	float lineForegound = 1.0  - smoothstep(width, width + 0.01, scaleForeground);
	
	vec3 bar = mix(lineBackground,color.rgb, lineForegound);
	COLOR = vec4(bar, 1.0);
}