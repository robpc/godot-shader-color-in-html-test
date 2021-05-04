shader_type spatial;
render_mode cull_disabled, unshaded;

uniform sampler2D color_ramp : hint_black_albedo;

void fragment() {
    ALBEDO = texture(color_ramp, vec2(1.0 - UV.y, 0)).rgb ;
}