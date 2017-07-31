#version 450 core

// glyph data types and buffers
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

uint get_lower(uint val) { return val & uint(0xFFFF); }
uint get_upper(uint val) { return val >> 16 & uint(0xFFFF); }
float fixed_to_float(uint val) { return float(val)/32.0; }
vec2 fixed2_to_vec2(uint val) { return vec2(fixed_to_float(get_lower(val)), fixed_to_float(get_upper(val))); }
vec2 uint_to_vec2(uint val) { return vec2(get_lower(val), get_upper(val)); }

uniform vec2 window_resolution;
uniform vec2 bitmap_resolution;

uniform vec2 string_offset = vec2(0.0);

out vec2 uv;
flat out int instance_id;

void main() {
    // passthrough
    instance_id = gl_InstanceID;

    // grab the relevant metadata from the buffers using the instance ID.
    GlyphInstance glyph_instance = glyph_instances[instance_id];
    GlyphMetric metric = glyph_metrics[get_lower(glyph_instance.index_palette)];

    // expand vertex ID to quad positions:
    int x = (gl_VertexID & 2) >> 1;
    int y = (((gl_VertexID & 1) << 1) ^ 3) >> 1;
    vec2 p = vec2(x, y); // unit square

    // grab the texture coordinates
    vec2 p0 = uint_to_vec2(metric.x0_y0);
    vec2 p1 = uint_to_vec2(metric.x1_y1);
    uv = (p0 + (p1 - p0)*p)/bitmap_resolution;

    // transform the vertex, starting from unit square
    p *= vec2(metric.xoff2 - metric.xoff, metric.yoff2 - metric.yoff); // scale
    p += vec2(metric.xoff, metric.yoff);                               // correct position relative to baseline
    p += fixed2_to_vec2(glyph_instance.x_y);                           // per-glyph positioning
    p += string_offset;                                                // move string
    p *= vec2(1.0, -1.0);                                              // invert y
    p *= 2.0/window_resolution;                                        // correct for aspect ratio and transform to NDC
    p += vec2(-1.0, 1.0);                                              // move to the upper left corner

    gl_Position = vec4(p, 0.0, 1.0);
}