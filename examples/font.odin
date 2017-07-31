/*
    OpenGL 4.5 font renderer

    Uses a binary font format for the full ascii range (95 characters), which looks like the following:

        first 4 bytes: number of font sizes
        for each font size
            a FontMetrics instance (16 bytes)
            95 GlyphMetrics instances (28 bytes each)
        the 1-byte bitmap

    You can supply your own font file that follows these specifications when calling `init(filename)`.
    A call to `init` should be matched with a call to `cleanup`.

    @NOTE: Currently the size of the bitmap is hard coded to be 2048 pixels wide (the height can be anything).


    You can use any of the following procedures to draw a string of characters:

        draw_format :: proc(offset_x, offset_y, size: f32,                     fmt_string: string, args: ...any) -> (int, f32, f32) // vararg formatted string, implicit 0 color palette
        draw_format :: proc(offset_x, offset_y, size: f32, palette_index: u16, fmt_string: string, args: ...any) -> (int, f32, f32) // vararg formatted string, explicit color palette
        draw_string :: proc(offset_x, offset_y, size: f32,                     str: string)                      -> (int, f32, f32) // unformatted string, implicit 0 color palette
        draw_string :: proc(offset_x, offset_y, size: f32, palette_index: u16, str: string)                      -> (int, f32, f32) // unformatted string, explicit color palette
        draw_string :: proc(offset_x, offset_y, size: f32, palette: []u16,     str: string)                      -> (int, f32, f32) // unformatted string, per-glyph color palette

    These will parse the string for you and place the strings appropriately, respecting new lines.
    Note: All of these returns the number of glyphs drawn (stripped for newlines newlines) and the horizontal and vertical span of the string.
    Note: If the font size is invalid, the drawing will be skipped.


    For explicit control of each glyph, you can use get_instances() to grab the GlyphInstance slice to update every part of it however you want:

        glyph_instances, glyph_metrics, font_metrics := font.get_data();
        

        // update glyph_instances

        font.upload_instances(num);
        font.draw_instances(num, offset_x, offset_y);

    @NOTE: The positions are 11.5 fixed point numbers, so to restrict the size of the data that is updated. 
           Use font.float_to_fixed(val) to convert.
           This also means that the maximum relative difference per glyph is restricted to 2048 pixels. 
           These are chosen so that a full window at 1080p can be spanned. 
           If you window is bigger than this, use string_offset to change the anchor.


    The color palette can be explicitly controlled:

        colors_font := font.get_colors();
        for i in 0..num {
            colors_font[i] = font.Vec4{f32(rng()), f32(rng()), f32(rng()), 1.0};
        }
        font.update_colors(num);
*/

import (
    "gl.odin";
    "os.odin";
    "mem.odin";
    "fmt.odin";
);

// wrapper to use GetUniformLocation with an Odin string
GetUniformLocation_ :: proc(program: u32, str: string) -> i32 {
    return gl.GetUniformLocation(program, &str[0]);;
}

GlyphMetrics :: struct #ordered {
    x0, y0, x1, y1: u16; 
    xoff, yoff, xadvance: f32;
    xoff2, yoff2: f32;
};

GlyphInstance :: struct #ordered {
    x, y: u16;
    index, palette: u16;
};

FontMetrics :: struct #ordered {
    size, ascent, descent, linegap: f32;
};

Vec4 :: struct #ordered {
    x, y, z, w: f32;
};

// f32 to 11.5 fixed point, round to nearest fractional part
// `val` between 0.0 and 2047.0
float_to_fixed :: proc(val: f32) -> u16 {
    return u16(32.0*val + 0.5);
}
// 11.5 fixed point to f32
fixed_to_float :: proc(val: u16) -> f32 {
    return f32(val)/32.0;
}



// filled up by user
max_instances :: 1000000; // a million glyphs should be more than sufficient. 
glyph_instances: [1000000]GlyphInstance;

// initialized from font binary file
glyph_metrics: []GlyphMetrics;
font_metrics: []FontMetrics;
width, height: int;

// 
max_colors :: 65535;
colors: [max_colors]Vec4;

// globals for storing opengl changed state
last_program, last_vertex_array: i32;
last_texture: i32;
last_blend_src, last_blend_dst: i32;
last_blend_equation_rgb, last_blend_equation_alpha: i32;
last_enable_blend, last_enable_depth_test: u8;

// opengl objects: 
glyph_instance_buffer, glyph_metric_buffer, color_buffer: u32;
vao, program: u32;
texture_bitmap: u32;



save_state :: proc() #inline {
    using gl;
    // save state
    GetIntegerv(CURRENT_PROGRAM, &last_program);
    GetIntegerv(VERTEX_ARRAY_BINDING, &last_vertex_array);

    ActiveTexture(TEXTURE0); 
    GetIntegerv(TEXTURE_BINDING_2D, &last_texture);

    GetIntegerv(BLEND_SRC, &last_blend_src);
    GetIntegerv(BLEND_DST, &last_blend_dst);
    
    GetIntegerv(BLEND_EQUATION_RGB, &last_blend_equation_rgb);
    GetIntegerv(BLEND_EQUATION_ALPHA, &last_blend_equation_alpha);

    last_enable_blend = IsEnabled(BLEND);
    last_enable_depth_test = IsEnabled(DEPTH_TEST);
}

restore_state :: proc() #inline {
    using gl;
    // restore state
    UseProgram(cast(u32)last_program);
    BindTexture(TEXTURE_2D, cast(u32)last_texture);
    BindVertexArray(cast(u32)last_vertex_array);

    BlendEquationSeparate(cast(u32)last_blend_equation_rgb, cast(u32)last_blend_equation_alpha);
    BlendFunc(cast(u32)last_blend_src, cast(u32)last_blend_dst);
    
    if last_enable_depth_test == TRUE do Enable(DEPTH_TEST);
    else do Disable(DEPTH_TEST);
    
    if last_enable_blend == TRUE do Enable(BLEND);
    else do Disable(BLEND);
}

update_instances_from_string :: proc(str: string, palette: []u16, idx: int) -> (int, f32, f32) #inline {
    // parse the string, place the glyphs appropriately and set the colors
    cursor_x := f32(4.0);
    cursor_y := f32(4.0 + int(1.0*font_metrics[idx].ascent + 0.5));

    extent_x := f32(0.0);
    extent_y := f32(0.0);
    max_extent_x := f32(0.0);

    num_instances := 0;
    for c, i in str {
        if c == '\n' {
            cursor_x  = f32(4.0);
            cursor_y += f32(int(font_metrics[idx].size + 0.5));

            max_extent_x = max(max_extent_x, extent_x);
            extent_x = 0.0;
            extent_y += f32(int(font_metrics[idx].size + 0.5));
            continue;
        }
        glyph_instances[i].x = float_to_fixed(cursor_x);
        glyph_instances[i].y = float_to_fixed(cursor_y);
        glyph_instances[i].index = u16(idx)*95 + (u16(c) - 32);
        
        if len(palette) == len(str) do glyph_instances[i].palette = palette[i] % len(colors);
        else if len(palette) == 1   do glyph_instances[i].palette = palette[0] % len(colors);
        
        cursor_x += glyph_metrics[u16(idx)*95+(u16(c) - 32)].xadvance;
        extent_x += glyph_metrics[u16(idx)*95+(u16(c) - 32)].xadvance;
        num_instances += 1;
    }
    max_extent_x = max(max_extent_x, extent_x);
    if extent_x > 0.0 do extent_y += f32(int(font_metrics[idx].size + 0.5));


    upload_instances(num_instances);

    return num_instances, max_extent_x, extent_y;
}

upload_instances :: proc(num_instances: int) {
    gl.NamedBufferSubData(glyph_instance_buffer, 0, size_of(GlyphInstance)*num_instances, &glyph_instances[0]);
}

draw_instances :: proc(num_instances: int, offset_x, offset_y: f32) {
    using gl;

    save_state();

    // Change state
    Disable(DEPTH_TEST);
    Enable(BLEND);
    BlendEquation(FUNC_ADD);
    BlendFunc(SRC_ALPHA, ONE_MINUS_SRC_ALPHA);

    BindTexture(TEXTURE_2D, texture_bitmap);
    UseProgram(program);

    dims: [4]i32;
    GetIntegerv(VIEWPORT, &dims[0]);
    Uniform2f(GetUniformLocation_(program, "window_resolution"), f32(dims[2] - dims[0]), f32(dims[3]-dims[1]));
    
    Uniform2f(GetUniformLocation_(program, "string_offset"), f32(offset_x), f32(offset_y)); 
    Uniform2f(GetUniformLocation_(program, "bitmap_resolution"), f32(width), f32(height)); 
    Uniform1i(GetUniformLocation_(program, "sampler_bitmap"), 0);

    BindVertexArray(vao);
    DrawArraysInstanced(TRIANGLE_STRIP, 0, 4, cast(i32)num_instances);

    restore_state();
}

draw_format :: proc(offset_x, offset_y, size: f32, fmt_string: string, args: ...any) -> (num_instances: int, dx, dy: f32) #inline {
    return draw_format(offset_x, offset_y, size, 0, fmt_string, ...args);
}

draw_format :: proc(offset_x, offset_y, size: f32, palette_index: u16, fmt_string: string, args: ...any) -> (num_instances: int, dx, dy: f32) #inline {
    if len(fmt_string) >= 512 do return 0, 0, 0;
    buf: [512]u8;
    a := fmt.bprintf(buf[..], fmt_string, ...args);
    return draw_string(offset_x, offset_y, size, palette_index, a);
}

draw_string :: proc(offset_x, offset_y, size: f32, str: string) -> (num_instances: int, dx, dy: f32) #inline {
    return draw_string(offset_x, offset_y, size, 0, str);
}

draw_string :: proc(offset_x, offset_y, size: f32, palette_index: u16, str: string) -> (num_instances: int, dx, dy: f32) #inline {
    palette := [1]u16{palette_index};
    return draw_string(offset_x, offset_y, size, palette[..], str);
}

draw_string :: proc(offset_x, offset_y, size: f32, palette: []u16, str: string) -> (num_instances: int, dx, dy: f32) {
    // generic string drawing routine
    // try to find the requested size, if not, return
    idx := -1;
    for font_metric, i in font_metrics {
        if font_metric.size == size {
            idx = i;
        }
    }
    if idx == -1 do return 0, 0.0, 0.0;

    // check if there is a 1-1 correspondence between the palette slice and the string, 
    // or if there's only one color given
    // otherwise, return
    if (len(palette) != len(str)) && (len(palette) != 1) do return 0, 0.0, 0.0;

    num_instances, dx, dy := update_instances_from_string(str, palette, idx);

    draw_instances(num_instances, offset_x, offset_y);

    return num_instances, dx, dy;
}

get_data :: proc() -> ([]GlyphInstance, []GlyphMetrics, []FontMetrics) {
    return glyph_instances[..], glyph_metrics[..], font_metrics[..];
}

get_colors :: proc() -> []Vec4 {
    return colors[..];
}

update_colors :: proc(num: int) {
    gl.NamedBufferSubData(color_buffer, 0, size_of(Vec4)*num, &colors[0]);
}

cleanup :: proc() {
    using gl;
    DeleteProgram(program);
    DeleteVertexArrays(1, &vao);
    DeleteTextures(1, &texture_bitmap);

    DeleteBuffers(1, &glyph_instance_buffer);
    DeleteBuffers(1, &glyph_metric_buffer);
    DeleteBuffers(1, &color_buffer);

    //free(glyph_instances);
    free(glyph_metrics);
    free(font_metrics);
}

init :: proc(filename, filename_vs, filename_fs: string) -> bool {
    using gl;

    // grab the binary font data
    data_3x1, success_3x1 := os.read_entire_file(filename);
    if !success_3x1 do return false;
    defer free(data_3x1);

    // grab the shaders
    success_shaders: bool;
    program, success_shaders = load_shaders(filename_vs, filename_fs);
    if !success_shaders do return false;

    // the first 4 bytes is the number of font sizes
    num_sizes := cast(int)mem.slice_ptr(cast(^i32)&data_3x1[0], 1)[0];

    // allocate slices/arrays
    font_metrics    = make([]FontMetrics,   num_sizes);
    glyph_metrics   = make([]GlyphMetrics,  num_sizes*95);
    //glyph_instances = make([]GlyphInstance, max_instances);

    colors[0] = Vec4{0.0, 0.0, 0.0, 1.0};
    colors[1] = Vec4{1.0, 0.0, 0.0, 1.0};
    colors[2] = Vec4{0.0, 1.0, 0.0, 1.0};
    colors[3] = Vec4{0.0, 0.0, 1.0, 1.0};

    // parse the remaining data
    rest := data_3x1[4..];
    for i in 0..num_sizes {
        font_metrics[i] = mem.slice_ptr(cast(^FontMetrics)&rest[0], 1)[0];
        rest = rest[16..];

        for j in 0..95 do glyph_metrics[i*95 + j] = mem.slice_ptr(cast(^GlyphMetrics)&rest[0], 95)[j];
        
        rest = rest[size_of(GlyphMetrics)*95..];
    }

    bitmap := rest;
    
    width = 2048;
    height = len(bitmap)/2048;

    // create and initialize opengl objects
    CreateVertexArrays(1, &vao);

    // @TODO: update to bindless textures?
    GenTextures(1, &texture_bitmap);
    ActiveTexture(TEXTURE0);
    BindTexture(TEXTURE_2D, texture_bitmap);

    TexParameteri(TEXTURE_2D, TEXTURE_MIN_FILTER, LINEAR);
    TexParameteri(TEXTURE_2D, TEXTURE_MAG_FILTER, LINEAR);
    TexImage2D(TEXTURE_2D, 0, RED, i32(width), i32(height), 0, RED, UNSIGNED_BYTE, &bitmap[0]);
    
    // SSBO's for general gpu storage, used for indirect lookup using instance ID
    CreateBuffers(1, &glyph_instance_buffer);
    CreateBuffers(1, &glyph_metric_buffer);
    CreateBuffers(1, &color_buffer);

    BindBufferBase(SHADER_STORAGE_BUFFER, 0, glyph_instance_buffer);
    BindBufferBase(SHADER_STORAGE_BUFFER, 1, glyph_metric_buffer);
    BindBufferBase(SHADER_STORAGE_BUFFER, 2, color_buffer);

    NamedBufferData(glyph_instance_buffer, size_of(GlyphInstance)*max_instances, nil,               DYNAMIC_READ);
    NamedBufferData(glyph_metric_buffer,   size_of(GlyphMetrics)*num_sizes*95,   &glyph_metrics[0], DYNAMIC_READ);
    NamedBufferData(color_buffer,          size_of(colors),                      &colors[0],        DYNAMIC_READ);

    return true;
}