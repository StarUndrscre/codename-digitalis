shader_type canvas_item;

#define RM_FACTOR   1.0
#define RM_ITERS    90

float plasma(vec3 r) {
	float mx = r.x + TIME / 0.130;
	mx += 20.0 * sin((r.y + mx) / 20.0 + TIME / 0.810);
	float my = r.y - TIME / 0.200;
	my += 30.0 * cos(r.x / 23.0 + TIME / 0.710);
	return r.z - (sin(mx / 7.0) * 2.25 + sin(my / 3.0) * 2.25 + 5.5);
}

float scene(vec3 r) {
	return plasma(r);
}

float raymarch(vec3 pos, vec3 dir) {
	float dist = 0.0;
	float dscene;

	for (int i = 0; i < RM_ITERS; i++) {
		dscene = scene(pos + dist * dir);
		if (abs(dscene) < 0.1)
			break;
		dist += RM_FACTOR * dscene;
	}

	return dist;
}

void fragment() {
	float c, s;
	float vfov = 90000.0;

	vec3 cam = vec3(0.0, 0.0, 1.0);

	vec2 uv = (FRAGCOORD.xy / SCREEN_PIXEL_SIZE.xy) - 0.5;
	uv.x *= SCREEN_PIXEL_SIZE.x / SCREEN_PIXEL_SIZE.y;
	uv.y *= -1.0;

	vec3 dir = vec3(0.0, 0.0, -1.0);

	float xrot = vfov * length(uv);

	c = cos(xrot);
	s = sin(xrot);
	dir = mix(
		vec3(1.0, 0.0, 0.0),
	    vec3(0.0,   c,  -s),
	    vec3(0.0,   s,   c)
	    ) * dir;

	c = normalize(uv).x;
	s = normalize(uv).y;
	dir = mix( 
		vec3(  c,  -s, 0.0),
	    vec3(  s,   c, 0.0),
	    vec3(0.0, 0.0, 1.0)
	    ) * dir;

	c = cos(0.7);
	s = sin(0.7);
	dir = mix(
		vec3(  c, 0.0,   s),
	    vec3(0.0, 1.0, 0.0),
	    vec3( -s, 0.0,   c)
	    ) * dir;

	float dist = raymarch(cam, dir);
	vec3 pos = cam + dist * dir;

	COLOR.rgb = mix(
		vec3(0.4, 0.8, 1.0),
		mix(
			vec3(0.0, 0.0, 1.0),
			vec3(1.0, 1.0, 1.0),
			pos.z / 10.0
		),
		1.0 / (dist / 20.0)
	);
}