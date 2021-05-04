shader_type spatial;
render_mode cull_disabled, unshaded;

uniform vec4 startcol : hint_color;
uniform vec4 endcol : hint_color;

void fragment() {
    ALBEDO = mix(startcol.xyz,endcol.xyz, 1.0 - UV.y);
}