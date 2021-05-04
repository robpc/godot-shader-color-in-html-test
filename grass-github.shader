shader_type spatial;
render_mode cull_disabled, unshaded;

uniform sampler2D color_ramp : hint_black_albedo;

vec3 adjust_rgb(vec3 color){
    return mix(pow((color + vec3(0.055)) * (1.0 / (1.0 + 0.055)),vec3(2.4)),color * (1.0 / 12.92),lessThan(color,vec3(0.04045)));
}

void fragment() {
    vec3 color = texture(color_ramp, vec2(1.0 - UV.y, 0)).rgb;
    if (!OUTPUT_IS_SRGB) {
        color = adjust_rgb(color);
    }
    ALBEDO = color ;
}