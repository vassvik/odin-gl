#version 450 core

struct GlyphInstance {
    uint x_y;
    uint index_palette;
};

struct GlyphMetric {
    uint x0_y0, x1_y1;
    float xoff, yoff, xadvance;
    float xoff2, yoff2;
};

layout (std430, binding = 0) buffer glyph_instance_buffer {
    GlyphInstance glyph_instances[];
};

layout (std430, binding = 1) buffer glyph_metric_buffer {
    GlyphMetric glyph_metrics[];
};

layout (std430, binding = 2) buffer color_buffer {
    vec3 palette[];
};

flat in int instance_id;
in vec2 uv;

uniform sampler2D sampler_bitmap;

out vec4 color;

uint get_lower(uint val) {
    return (val&0x0000FFFF);
}
uint get_upper(uint val) {
    return (val&0xFFFF0000)>>16;
}

void main() {
    // alpha blending
     float a = texture(sampler_bitmap, uv).r;
     vec3 c = palette[get_upper(glyph_instances[instance_id].index_palette)&3];
     color = vec4(c, a);
}