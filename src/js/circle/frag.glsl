#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif
  
  precision mediump float;
  uniform vec4 u_color;
  uniform float u_time;
  varying vec2 vPos;


float circle(vec2 pt, vec2 center, float radius){
  vec2 p = pt - center;
  return 1.0 - step(radius, length(p));
}

// float random(float x){
//   return sin(x) * 1000000
// }

	vec3 hexToCell(vec3 hex, float m) {
		return fract(hex / m) * 2.0 - 1.0;
	}

  void main () {
    float circleCount = 100.0;

    // float r = random(0.25);
    float r  = 0.25;
    vec2 p = fract(vPos * 0.5 * circleCount);
    // vec2 circle = circle(p, vec2(0.5), r);
    // vec3 hex = hexToCell(vec3(circle,0.0), 0.4);
    // float inCircle = 1.0 - step(0.5,length(vPos));
    // vec3 circleColor = vec3(0.2,0.5,0.2) * inCircle;
    vec3 circleColor = vec3(0.7, 0.2, 0.6) * circle(p, vec2(0.5), r);
    // vec3 hex = hexToCell(circleColor, 0.3);
    gl_FragColor = vec4(circleColor, 1.0);
  }