shader_type canvas_item;
uniform sampler2D deg;
uniform float scale = 5.0;
uniform float speed = 1.0;
uniform float final = 1.0;
uniform vec2 position = vec2(0,0);
vec2 random(vec2 uv){
    uv = vec2( dot(uv, vec2(127.1,311.7) ),
               dot(uv, vec2(269.5,183.3) ) );
    return -1.0 + 2.0 * fract(sin(uv) * 43758.5453123);
}

float noise(vec2 uv) {
    vec2 uv_index = floor(uv);
    vec2 uv_fract = fract(uv);

    vec2 blur = smoothstep(0.0, 1.0, uv_fract);

    return mix( mix( dot( random(uv_index + vec2(0.0,0.0) ), uv_fract - vec2(0.0,0.0) ),
                     dot( random(uv_index + vec2(1.0,0.0) ), uv_fract - vec2(1.0,0.0) ), blur.x),
                mix( dot( random(uv_index + vec2(0.0,1.0) ), uv_fract - vec2(0.0,1.0) ),
                     dot( random(uv_index + vec2(1.0,1.0) ), uv_fract - vec2(1.0,1.0) ), blur.x), blur.y) + 0.5;
}


void fragment() {
	vec2 center = vec2(0.5, 0.5);
	float n = noise(UV*scale + TIME*speed + position)+ noise(UV*scale + TIME*-1.0*speed + position);
	n /= 2.0;
	n /= 5.0;
	n += 0.2; //0.4
	COLOR.rgb = vec3(n, n, n);
	float FinalA = final;
	if(final<0.0){
		FinalA = 0.0;
	}
	COLOR.a = texture(deg, vec2(length(UV-center)*2.0, 0)).r * FinalA;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	